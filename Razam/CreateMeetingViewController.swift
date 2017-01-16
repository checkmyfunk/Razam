//
//  CreateMeetingViewController.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/15/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import UIKit

class CreateMeetingViewController: UIViewController {

    @IBOutlet weak var meetingDescriptionText: UITextField!
    @IBOutlet weak var meetingCompanySwitch: UISwitch!
    
    var previousViewController = MeetingsListViewController()
    
    @IBAction func createMeetingTapped(_ sender: AnyObject) {
        //create new meeting from the CreateMeetingViewController
        let meeting = Meeting()
        meeting.text = meetingDescriptionText.text!
        meeting.company = meetingCompanySwitch.isOn
        //will need to add latitude and longitude after the geolocation services are added
        
        
        
        //add new meeting to the array of meetings 
        previousViewController.meetings.append(meeting)
        previousViewController.meetingsListView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
