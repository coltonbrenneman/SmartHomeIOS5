//
//  ToggleAllDevicesViewController.swift
//  SmartHomeIOS5
//
//  Created by Colton Brenneman on 6/8/23.
//

import UIKit

class ToggleAllDevicesViewController: UIViewController {

   // MARK: - Actions
    @IBAction func turnAllOnButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Constants.Notifications.allDevicesOn, object: nil)
    }
    
    @IBAction func turnAllOffButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Constants.Notifications.allDevicesOff, object: nil)
    }
} //End of class
