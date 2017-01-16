//
//  SettingsViewController.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/15/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setProfileSettings(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showMeetingsList", sender: self)
    }
    
}
