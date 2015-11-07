//
//  imdbAPIClient.swift
//  Swift-MovieNight
//
//  Created by Jim Campagno on 11/6/15.
//  Copyright © 2015 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit

class imdbAPIClient {
    
    class func movieInfoWithTitle(title: String, completion: (result: Movie) -> Void) {
        
        let movieStringForURL = title.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        let urlString = "http://www.omdbapi.com/?t=\(movieStringForURL)&plot=short&r=json"
        
        let url = NSURL(string: urlString)
        
        let mySession = NSURLSession.sharedSession()
        
        if let url = url {
            let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
                
                if (error != nil) {
                    print("error: \(error?.localizedDescription)")
                    return
                }
                
                if let data = data {
                    do {
                        let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                        
                        let newMovie = Movie.init(movieDictionary: jsonData)
                        completion(result: newMovie)
                        
                    } catch {
                    
                    }
                }
            })
            
            networkTask.resume()
        }
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}