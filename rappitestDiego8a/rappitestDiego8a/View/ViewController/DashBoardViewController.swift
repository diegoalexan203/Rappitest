//
//  DashBoardViewController.swift
//  rappitestDiego8a
//
//  Created by Diego Ochoa on 31/01/22.
//

import Foundation
import NVActivityIndicatorView
import RxCocoa
import RxSwift
import UIKit

class DashBoardViewController: UIViewController {
    let disposeBag = DisposeBag()
    let dashBoardViewModel = DashBoardViewModel()
    var arrMovies: [MoviesEntity] = []
    var page: Int = 1
    var activityIndicator: NVActivityIndicatorView!
    var ispaginating: Bool = false

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.register(OptionViewCell.nib(), forCellWithReuseIdentifier: OptionViewCell.identifier)
        createProgressIndicator()
        bind()
    }

    fileprivate func createProgressIndicator() {
        let xAxis = (view.frame.size.width / 2)
        let yAxis = (view.frame.size.height / 2)
        let frame = CGRect(x: xAxis - 20, y: yAxis, width: 50, height: 50)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = .ballClipRotate // add your type
        activityIndicator.color = UIColor.red // add your color
        activityIndicator.tintColor = UIColor.darkGray
        view.addSubview(activityIndicator)
    }

    func bind() {
        dashBoardViewModel.input.page.accept(String(page))
        dashBoardViewModel.output.movies.subscribe(onNext: {
                                                       response in
                                                       self.arrMovies = response ?? []
                                                       self.collectionView.reloadData()
                                                       self.ispaginating = false
                                                   },
                                                   onError: { _ in
                                                       self.hideactivityIndicator()
                                                       print("se presento un problema")
                                                   }
        ).disposed(by: disposeBag)
        dashBoardViewModel.output.isLoading.subscribe(onNext: {
            respose in
            if respose {
                self.activityIndicator.startAnimating()
            } else {
                self.hideactivityIndicator()
            }
        }, onError: { _ in }).disposed(by: disposeBag)
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        collectionView.rx.setDataSource(self).disposed(by: disposeBag)
    }

    func hideactivityIndicator() {
        activityIndicator.stopAnimating()
    }
}
