//
//  SMNMovie.swift
//  Swift-MovieNight
//
//  Created by Jim Campagno on 11/6/15.
//  Copyright © 2015 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    var actors: [String]
    var country: String
    var director: String
    var plot: String
    var posterString: String
    var poster: UIImage?
    var released: String
    var runtime: String
    var title: String
    var writer: String
    var year: String
    var imdbRating: String
    var imdbVotes: String
    
    init(actors: [String], country: String, director: String, plot: String, posterString: String, poster: UIImage?, released: String, runtime: String, title: String, writer: String, year: String, imdbRating: String, imdbVotes: String) {
        self.actors = actors
        self.country = country
        self.director = director
        self.plot = plot
        self.posterString = posterString
        self.released = released
        self.runtime = runtime
        self.title = title
        self.writer = writer
        self.year = year
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        
        if let poster = poster {
            self.poster = poster
        }
    }
    
    
    
    convenience init(movieDictionary: NSDictionary) {
        
        
        
        self.init(actors: [], country: <#T##String#>, director: <#T##String#>, plot: <#T##String#>, posterString: <#T##String#>, poster: <#T##UIImage?#>, released: <#T##String#>, runtime: <#T##String#>, title: <#T##String#>, writer: <#T##String#>, year: <#T##String#>, imdbRating: <#T##String#>, imdbVotes: <#T##String#>)
        
//        Testing {
//            Actors = "Sam Neill, Laura Dern, Jeff Goldblum, Richard Attenborough";
//            Awards = "Won 3 Oscars. Another 25 wins & 16 nominations.";
//            Country = USA;
//            Director = "Steven Spielberg";
//            Genre = "Adventure, Sci-Fi, Thriller";
//            Language = "English, Spanish";
//            Metascore = 68;
//            Plot = "During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.";
//            Poster = "http://ia.media-imdb.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_SX300.jpg";
//            Rated = "PG-13";
//            Released = "11 Jun 1993";
//            Response = True;
//            Runtime = "127 min";
//            Title = "Jurassic Park";
//            Type = movie;
//            Writer = "Michael Crichton (novel), Michael Crichton (screenplay), David Koepp (screenplay)";
//            Year = 1993;
//            imdbID = tt0107290;
//            imdbRating = "8.1";
//            imdbVotes = "544,507";
//        }

        
        
        
    }
}
