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
        
        
        
        
    }
    
    func setupTheInitialView() {
        movieBanner.backgroundColor = UIColor(patternImage: UIImage(imageLiteral: "Movie"))
    }
}