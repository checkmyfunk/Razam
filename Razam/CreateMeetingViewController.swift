//
//  CreateMeetingViewController.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/15/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import UIKit
import MapKit

class CreateMeetingViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var meetingDescriptionText: UITextField!
    @IBOutlet weak var meetingCompanySwitch: UISwitch!
    
    //setting up location manager
    var locationManager = CLLocationManager()
    
    @IBAction func createMeetingTapped(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let meeting = Meeting(context: context)
        meeting.text = meetingDescriptionText.text!
        meeting.company = meetingCompanySwitch.isOn
        meeting.latitude = locationManager.location!.coordinate.latitude
        meeting.longitude = locationManager.location!.coordinate.longitude
        
        
        //saving to core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //stop monitoring location from this view after meeting is created
        locationManager.stopUpdatingLocation()
        
        //navigate to previous view controller
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //location manager setup
        locationManager.delegate = self
        
        //verify if user already granted permissions to use location
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("ready to go")
        } else {
            //ask user for location permissions
            locationManager.requestWhenInUseAuthorization()
        }
        
        //setting location accuracy and starting to update location
        //??? do we need to stop updating location once we are out of this view?
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationValue:CLLocationCoordinate2D = locationManager.location!.coordinate
        print("locations = \(locationValue.latitude) \(locationValue.longitude)")
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
