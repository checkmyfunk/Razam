//
//  MeetingDetailsViewController.swift
//  Razam
//
//  Created by Vitali Potchekin on 1/20/17.
//  Copyright © 2017 Vitali Potchekin. All rights reserved.
//

import UIKit

class MeetingDetailsViewController: UIViewController {
    
    var meeting : Meeting? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //Delete meeting - will need to call it on timeout as well
    @IBAction func deleteMeetingTapped(_ sender: AnyObject) {
        //should the context be declared outside of the function??
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //should we verify that the meeting in not nil??
        context.delete(meeting!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
