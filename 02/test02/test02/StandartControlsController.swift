//
//  StandartControlsController.swift
//  test02
//
//  Created by Gennady Evstratov on 29/09/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class StandartControlsController: UIViewController {
    
    var passwordText: String?
    
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var progressIndicator: UIProgressView!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var stepper: UIStepper!
    
    @IBOutlet var switchControl: UISwitch!
    
    
    @IBAction func switchValueChanged(_ sender: AnyObject) {
        stepper.isEnabled = switchControl.isOn
        slider.isEnabled = switchControl.isOn
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let xibViewController = XIBViewController(nibName: "XIBViewController", bundle: nil)
        navigationController?.pushViewController(xibViewController, animated: true)
    }
    
    
    @IBAction func sliderValueChange(_ sender: AnyObject) {
        label.text = "\(slider.value)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = passwordText
    }
}
