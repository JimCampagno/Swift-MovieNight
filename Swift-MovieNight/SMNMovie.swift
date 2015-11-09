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
        var arrayOfActors = [String]()
        var finalListOfActors = [String]()
        let nameOfActors = movieDictionary["Actors"] as? String
        
        if let nameOfActors = nameOfActors {
            arrayOfActors = nameOfActors.componentsSeparatedByString(",")
        }
        
        for var actor in arrayOfActors {
            let firstActorInArray = arrayOfActors[0]
            
            if actor == firstActorInArray {
                finalListOfActors.append(actor)
                continue
            }
        
            actor.removeAtIndex(actor.startIndex)
            finalListOfActors.append(actor)
        }
        
//        {"Title":"Jurassic Park","Year":"1993","Rated":"PG-13","Released":"11 Jun 1993","Runtime":"127 min","Genre":"Adventure, Sci-Fi, Thriller","Director":"Steven Spielberg","Writer":"Michael Crichton (novel), Michael Crichton (screenplay), David Koepp (screenplay)","Actors":"Sam Neill, Laura Dern, Jeff Goldblum, Richard Attenborough","Plot":"During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.","Language":"English, Spanish","Country":"USA","Awards":"Won 3 Oscars. Another 25 wins & 16 nominations.","Poster":"http://ia.media-imdb.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_SX300.jpg","Metascore":"68","imdbRating":"8.1","imdbVotes":"544,507","imdbID":"tt0107290","Type":"movie","Response":"True"}
        
        
        self.init(actors: finalListOfActors,
            country: movieDictionary["Country"] as! String,
            director: movieDictionary["Director"] as! String,
            plot: movieDictionary["Plot"] as! String,
            posterString: movieDictionary["Poster"] as! String,
            poster: nil,
            released: movieDictionary["Released"] as! String,
            runtime: movieDictionary["Runtime"] as! String,
            title: movieDictionary["Title"] as! String,
            writer: "Jim",
            year: movieDictionary["Year"] as! String,
            imdbRating: movieDictionary["imdbRating"] as! String,
            imdbVotes: movieDictionary["imdbVotes"] as! String)
        
        
    }
}

extension Movie: CustomStringConvertible {
    var description: String {
        
        let responseDictionary = ["title": title, "actors": actors]
        
        //return "MyClass \(string)"
        return "\(self.dynamicType) : \(responseDictionary)"
    }
}



