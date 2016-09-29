//
//  XIBViewController.swift
//  test02
//
//  Created by Gennady Evstratov on 29/09/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class XIBViewController: UIViewController {

    var passwordField: String?
    
    @IBOutlet var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = passwordField
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let viewController = HandViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func dismissButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
