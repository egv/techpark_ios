//
//  ViewController.swift
//  test
//
//  Created by Gennady Evstratov on 22/09/2016.
//  Copyright © 2016 Projector. All rights reserved.
//



// https://developer.apple.com



import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadImage()
    }

    @IBAction func getImageButtonPressed(sender: AnyObject) {
        loadImage()
    }

    func loadImage() {
        let imageData = NSData(contentsOfURL: NSURL(string: "http://lorempixel.com/310/310")!)!
        imageView.image = UIImage(data: imageData)
    }
}

