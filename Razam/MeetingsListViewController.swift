//
//  MeetingsListViewController.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/15/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import UIKit

class MeetingsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var meetingsListView: UITableView!
    
    var meetings : [Meeting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        meetings = makeMeetings()
        
        meetingsListView.dataSource = self
        meetingsListView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let meeting = meetings[indexPath.row]
        cell.textLabel?.text = meeting.text
        return cell
    }
    
    func makeMeetings() -> [Meeting]{
        let meeting1 = Meeting()
        meeting1.text = "Hello there!"
        meeting1.latitude = 0.0
        meeting1.longitude = 0.0
        meeting1.photo = ""
        meeting1.company = true
        
        let meeting2 = Meeting()
        meeting2.text = "Cute undrdog looking for love!"
        meeting2.latitude = 1.0
        meeting2.longitude = 1.0
        meeting2.photo = ""
        meeting2.company = false
        
        return [meeting1, meeting2]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! CreateMeetingViewController
        nextViewController.previousViewController = self
    }
    
    @IBAction func addMeetingTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "showAddMeeting", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
