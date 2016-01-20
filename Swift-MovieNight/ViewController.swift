//
//  ViewController.swift
//  Swift-MovieNight
//
//  Created by Jim Campagno on 11/1/15.
//  Copyright © 2015 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var movieSearchTextField: UITextField!
    
    let movieSegue: String = "movieSearch"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        imageView.image = UIImage(imageLiteral: "leo")
    
    }
    
    @IBAction func searchForMovie(sender: UIButton) {
        
        if let movieText = movieSearchTextField.text where movieText.characters.count > 1 {
            
            performSegueWithIdentifier(movieSegue, sender: nil)
            
        } else {
            
            //no text has been entered, prsent warning
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destVC = segue.destinationViewController as! MovieDetailViewController
        
        destVC.movieToSearchFor = movieSearchTextField.text!
        
    }
    
}