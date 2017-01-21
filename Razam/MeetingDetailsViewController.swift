//
//  MeetingDetailsViewController.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/20/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import UIKit

class MeetingDetailsViewController: UIViewController {
    
    var meeting = Meeting ()
    var previousViewController = MeetingsListViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func deleteMeetingTapped(_ sender: AnyObject) {
        previousViewController.meetings.remove(at: previousViewController.selectedMeeting)
        
        previousViewController.meetingsListView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
