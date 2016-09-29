//
//  TextViewController.swift
//  test02
//
//  Created by Gennady Evstratov on 29/09/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet var passwordField: UITextField!
    @IBOutlet var textView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordField.text = "123"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // test_segue

    @IBAction func handButtonPressed(_ sender: AnyObject) {
        let xibViewController = XIBViewController(nibName: "XIBViewController", bundle: nil)
        xibViewController.passwordField = passwordField.text
        navigationController?.present(xibViewController, animated: true, completion: nil)
    }
    
    @IBAction func manualButtonPressed(_ sender: AnyObject) {
        guard shouldPerformSegue(withIdentifier: "test_segue", sender: nil) else {
            return
        }

        performSegue(withIdentifier: "test_segue", sender: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "test_segue" else {
            NSLog("not out segue")
            return true
        }
        
        return passwordField.text == "123"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "test_segue" else {
            NSLog("not out segue")
            return
        }
        
        guard let viewController = segue.destination as? StandartControlsController else {
            return
        }
        
        viewController.passwordText = textView.text
    }
    
    

}
