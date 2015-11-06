//
//  MovieDetailViewController.swift
//  Swift-MovieNight
//
//  Created by Jim Campagno on 11/1/15.
//  Copyright © 2015 Gamesmith, LLC. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieBanner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTheInitialView()
        self.getRequestForMovie("Jurassic Park")
    }
    
    func setupTheInitialView() {
        movieBanner.backgroundColor = UIColor(patternImage: UIImage(named: "Movie")!)
    }
    
    
    func getRequestForMovie(movie: String) {
        let movieStringForURL = movie.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
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
                        
                        print("Testing \(jsonData)")
                        
                    } catch {
                        
                        
                    }
                }
            })
            
            networkTask.resume()
        }
    }
    
}