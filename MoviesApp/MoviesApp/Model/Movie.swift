//
//  Movie.swift
//  MoviesApp
//
//  Created by Şehriban Yıldırım on 3.02.2023.
//

import Foundation
class Movie{
    
    var filmId:Int?
    var filmBaslik:String?
    var filmResimAdi:String?
    var filmFiyat:Double?
    
    init() {
        
    }
    
    init(filmId:Int,filmBaslik:String,filmResimAdi:String,filmFiyat:Double) {
        self.filmId = filmId
        self.filmBaslik = filmBaslik
        self.filmResimAdi = filmResimAdi
        self.filmFiyat = filmFiyat
    }
}
