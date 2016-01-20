//
//  MovieDetailViewController.swift
//  Swift-MovieNight
//
//  Created by Jim Campagno on 11/1/15.
//  Copyright © 2015 Gamesmith, LLC. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var actorTableView: UITableView!
    @IBOutlet weak var movieBanner: UIView!
    @IBOutlet weak var actorsView: UIView!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var durationOfFilmLabel: UILabel!
    @IBOutlet weak var imdbRatingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var titleOfMovieLabel: UILabel!
    
    let kHeightForRows: CGFloat = 72
    var currentMovie: Movie?
    var movieToSearchFor: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTheInitialView()
        
        actorTableView.delegate = self
        actorTableView.dataSource = self
        
        imdbAPIClient.movieInfoWithTitle(movieToSearchFor) { newMovie in
            
            guard let newMovie = newMovie else { return }
            
            dispatch_async(dispatch_get_main_queue()) { [unowned self] _ in
                
                self.currentMovie = newMovie
                self.durationOfFilmLabel.text = newMovie.runtime
                self.imdbRatingLabel.text = newMovie.imdbRating
                self.releaseDateLabel.text = newMovie.released
                self.directorLabel.text = newMovie.director
                self.writerLabel.text = newMovie.writer
                self.titleOfMovieLabel.text = newMovie.title
                
                self.actorTableView.reloadData()
                
            }
            
        }
    }
    
    func setupTheInitialView() {
        movieBanner.backgroundColor = UIColor(patternImage: UIImage(named: "Movie")!)
        //        actorsView.backgroundColor = UIColor(patternImage: UIImage(named: "Actor Display Label")!)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows = currentMovie?.actors.count ?? 0
        return numberOfRows
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("actorCell", forIndexPath: indexPath)
        
        //        cell.backgroundColor = UIColor(patternImage: UIImage(named: "TableViewCellBackground")!)
        cell.imageView!.image = nil
        
        cell.backgroundColor = UIColor.redColor()
        
        let nameOfActor = currentMovie?.actors[indexPath.row]
        if let nameOfActor = nameOfActor {
            cell.textLabel!.text = nameOfActor
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return kHeightForRows
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
}