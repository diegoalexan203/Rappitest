//
//  DashBoardViewController+Delegate.swift
//  rappitestDiego8a
//
//  Created by Diego on 4/02/22.
//

import UIKit

extension DashBoardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = arrMovies.count
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "OptionViewCell", for: indexPath) as? OptionViewCell else {
            // Display a UIAlertController telling the user to check for an updated app..
            return UICollectionViewCell()
        }
        //let cell = collectionView.dequeueReusableCell(withReusedexPath) as! OptionViIdentifier: "OptionViewCell", for: OptionViewCell
        let card = arrMovies[indexPath.row]
        print(card.backdropPath ?? "vacio")
        let url = "https://image.tmdb.org/t/p/w200" + ( card.backdropPath ?? "")
        cell.movieImgeView.load(urlString: url)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = arrMovies[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController ?? DetailsViewController()
        vc.movies = cell
//        vc.modalPresentationStyle = .fullScreen
//        self.navigationController?.present(vc, animated: true, completion:nil)//(vc, sender: nil)
       
       self.navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.clear
    }
}
    

extension DashBoardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
}

        extension UIImageView {
            func load(urlString: String) {
                guard let url = URL(string: urlString) else {
                    return
                }
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.image = image
                            }
                        }
                    }
                }
            }
        }
