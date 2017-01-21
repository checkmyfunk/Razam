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
        
        meetingsListView.dataSource = self
        meetingsListView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMeetings()
        meetingsListView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let meeting = meetings[indexPath.row]
        //exclamation mark ensures that the value is printed and no "(Optional)" text is shown
        cell.textLabel?.text = meeting.text!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meeting = meetings[indexPath.row]
        performSegue(withIdentifier: "showMeetingDetails", sender: meeting)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //verify if Meeting Detials segue was triggered
        if segue.identifier == "showMeetingDetails" {
            let nextViewController = segue.destination as! MeetingDetailsViewController
            nextViewController.meeting = sender as? Meeting
        }
        
        
    }
    
    //adding new meeting
    @IBAction func addMeetingTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "showAddMeeting", sender: nil)
    }
    
    //load data from Core Data
    func getMeetings() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            meetings = try context.fetch(Meeting.fetchRequest()) as! [Meeting]
            print(meetings)
        } catch {
            print("CORE DATA ERROR")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
