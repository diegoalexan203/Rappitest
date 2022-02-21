//
//  DetailsViewController.swift
//  rappitestDiego8a
//
//  Created by Diego on 15/02/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moviesUiImage: UIImageView!
    var movies: MoviesEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        setUI()
    }

    func setUI() {
        nameLabel.text = movies.title ?? ""
        let url = "https://image.tmdb.org/t/p/w200" + ( movies.backdropPath ?? "")
        moviesUiImage.load(urlString: url)
    }
    
//    init() {
//         super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
