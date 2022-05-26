//
//  DescriptionController.swift
//  Moview
//
//  Created by Sabi on 10.04.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

class DescriptionController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var awardsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Title: " + MyVariables.Title
        yearLabel.text = "Year: " + MyVariables.Year
        releaseLabel.text = "Release Date: " + MyVariables.Released
        runtimeLabel.text = "Runtime: " + MyVariables.Runtime
        genreLabel.text = "Genre: " + MyVariables.Genre
        directorLabel.text = "Director: " + MyVariables.Director
        actorsLabel.text = "Actors: " + MyVariables.Actors
        plotLabel.text = "Plot: " + MyVariables.Plot
        languageLabel.text = "Language: " + MyVariables.Language
        countryLabel.text = "Country: " + MyVariables.Country
        awardsLabel.text = "Awards: " + MyVariables.Awards
        ratingLabel.text = "Rating: " + MyVariables.Ratings
        poster.kf.indicatorType = .activity
        poster.kf.setImage(with: URL(string: MyVariables.Poster), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
}
