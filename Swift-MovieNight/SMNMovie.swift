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



