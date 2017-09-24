//
//  ViewController.swift
//  Notification-simulate
//
//  Created by Ragaie alfy on 9/20/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showNotification(_ sender: Any) {
        
         // Notification.init("sfsa").Show()
        
            Notification.init("welcome to my application", title: "welcome", date: Date() as NSDate).Show()
        
         }

    @IBOutlet weak var showView: UIButton!

}

