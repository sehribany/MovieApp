//
//  MovieViewController.swift
//  MoviesApp
//
//  Created by Şehriban Yıldırım on 3.02.2023.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    var movieArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        let f1 = Movie(filmId: 1, filmBaslik: "Django", filmResimAdi: "django", filmFiyat: 100.99)
        let f2 = Movie(filmId: 2, filmBaslik: "Inception", filmResimAdi: "inception", filmFiyat: 150.99)
        let f3 = Movie(filmId: 3, filmBaslik: "Interstellar", filmResimAdi: "interstellar", filmFiyat: 150.99)
        let f4 = Movie(filmId: 4, filmBaslik: "Anadoluda", filmResimAdi: "birzamanlaranadoluda", filmFiyat: 130.99)
        let f5 = Movie(filmId: 5, filmBaslik: "The Hateful Eight", filmResimAdi: "thehatefuleight", filmFiyat: 120.99)
        let f6 = Movie(filmId: 6, filmBaslik: "The Pianist", filmResimAdi: "thepianist", filmFiyat: 150.99)
        
        movieArray.append(f1)
        movieArray.append(f2)
        movieArray.append(f3)
        movieArray.append(f4)
        movieArray.append(f5)
        movieArray.append(f6)
    }
    
    func tableDesing(){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
extension MovieViewController : UITableViewDelegate, UITableViewDataSource , UIAlertViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieArray[indexPath.row]
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "moviecell", for: indexPath) as! MovieCell
        cell.movieImage.image = UIImage(named: movie.filmResimAdi!)
        cell.movieName.text = movie.filmBaslik!
        cell.moviePrice.text = "\(movie.filmFiyat!) TL"
        cell.layer.borderWidth = 5
        cell.layer.cornerRadius = 20
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieArray[indexPath.row]
        
        let alertview = UIAlertController(title: "Film Adı", message: "\(movie.filmBaslik!)", preferredStyle: .alert)
        let okbutton = UIAlertAction(title: "Okey", style: .default)
        alertview.addAction(okbutton)
        present(alertview,animated: true,completion: nil)
    }
}
