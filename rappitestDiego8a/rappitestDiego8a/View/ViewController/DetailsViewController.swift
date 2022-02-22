//
//  DetailsViewController.swift
//  rappitestDiego8a
//
//  Created by Diego on 15/02/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var moviesUiImage: UIImageView!
    var movies: MoviesEntity!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        setUI()
    }

    func setUI() {
        nameLabel.text = movies.title
        let url = "https://image.tmdb.org/t/p/w200" + (movies.backdropPath ?? "")
        moviesUiImage.load(urlString: url)
    }
}
