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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.image = UIImage(imageLiteral: "leo")
        
        
    }


}