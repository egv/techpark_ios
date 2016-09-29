//
//  HandViewController.swift
//  test02
//
//  Created by Gennady Evstratov on 29/09/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 30))
        label.text = "Hand view controller"
        
        view.addSubview(label)
    }

}
