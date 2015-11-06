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
        self.getRequestForMovie("Jimbo")
        
        //        http://www.omdbapi.com/?t=Jurassic+Park&y=&plot=short&r=json
        
        
        
        
    }
    
    func setupTheInitialView() {
        movieBanner.backgroundColor = UIColor(patternImage: UIImage(named: "Movie")!)
    }
    
    
    func getRequestForMovie(movie: String) {
        
        
        let mySession = NSURLSession.sharedSession()
        let url = NSURL(string: "http://www.omdbapi.com/?t=Jurassic+Park&y=&plot=short&r=json")
        let networkTask = mySession.dataTaskWithURL(url!, completionHandler : {data, response, error -> Void in
            
            
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                
                print("Did this work?: \(jsonData)")
                
                
                // use jsonData
            } catch {
                // report error
            }
            
            
            
        })
        networkTask.resume()
        
        
        //        networkTask.resume()
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    //        let url = NSURL(string: "http://www.omdbapi.com/?t=Jurassic+Park&y=&plot=short&r=json")
    //        let session = NSURLSession.sharedSession()
    //
    //        let task = session.dataTaskWithURL(url!, completionHandler:
    //            {(data, reponse, error) in
    //                print("Task completed")
    //                // rest of the function...
    //        })
    //
    //        task.resume()
    
    
    
    
    //        let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
    //
    //            print("\(task)")
    //
    //
    //        }
    //
    //    }
    
    //        if let movie = movie {
    //
    //            print("Movie is not being used \(movie)")
    //
    //            if let url = NSURL(string: "http://www.omdbapi.com/?t=Jurassic+Park&y=&plot=short&r=json") {
    //
    //                let session = NSURLSession.sharedSession()
    //
    //                let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
    //
    //                    if let error = error {
    //                        print("error: \(error.localizedDescription): \(error.userInfo)")
    //                    }
    //                }
    //
    //
    //                //                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
    //                //
    //                //                        let movieResponse = NSMutableDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSMutableDictionary
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //                //
    //
    //
    //
    //
    //                //                    task.resume()
    //
    //
    //
    //
}