//
//  ViewController.swift
//  Moview
//
//  Created by Sabi on 10.04.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

struct MyVariables {
    static var url = ""
    static var query = ""
    static var Title = ""
    static var Year = ""
    static var Released = ""
    static var Runtime = ""
    static var Genre = ""
    static var Director = ""
    static var Actors = ""
    static var Plot = ""
    static var Language = ""
    static var Country = ""
    static var Awards = ""
    static var Poster = ""
    static var Ratings = ""
}


class ViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        MyVariables.query = text.replacingOccurrences(of: " ", with: "%20")
        MyVariables.url = "https://www.omdbapi.com/?t=" + MyVariables.query + "&apikey=4c4311a8"
        getJobList()
        titleLabel.text = MyVariables.Title
        yearLabel.text = MyVariables.Year
    }
    
    func getJobList() {
        AF.request(MyVariables.url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { return }
                self.convertJSON(from: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func convertJSON(from data: Data) {
        do {
            let json = try JSON(data: data)
            if let title = json["Title"].string {
                MyVariables.Title = title
                print(title)
            }
            if let year = json["Year"].string {
                MyVariables.Year = year
                print(year)
            }
            if let released = json["Released"].string {
                MyVariables.Released = released
                print(released)
            }
            if let runtime = json["Runtime"].string {
                MyVariables.Runtime = runtime
                print(runtime)
            }
            if let genre = json["Genre"].string {
                MyVariables.Genre = genre
                print(genre)
            }
            if let director = json["Director"].string {
                MyVariables.Director = director
                print(director)
            }
            if let actors = json["Actors"].string {
                MyVariables.Actors = actors
                print(actors)
            }
            if let plot = json["Plot"].string {
                MyVariables.Plot = plot
                print(plot)
            }
            if let language = json["Language"].string {
                MyVariables.Language = language
                print(language)
            }
            if let country = json["Country"].string {
                MyVariables.Country = country
                print(country)
            }
            if let awards = json["Awards"].string {
                MyVariables.Awards = awards
                print(awards)
            }
            if let country = json["Country"].string {
                MyVariables.Country = country
                print(country)
            }
            if let poster = json["Poster"].string {
                MyVariables.Poster = poster
                print(poster)
            }
            if let rating = json["Ratings"][0]["Value"].string {
                MyVariables.Ratings = rating
                print(rating)
            }
        } catch {
            print("ERROR: \(error)")
        }
    }
}

