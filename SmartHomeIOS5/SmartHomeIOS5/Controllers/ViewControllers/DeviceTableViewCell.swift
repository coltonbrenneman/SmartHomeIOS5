//
//  DeviceTableViewCell.swift
//  SmartHomeIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import UIKit

protocol DeviceTableViewCellDelegate: AnyObject {
    func isOnSwitchToggled(cell: DeviceTableViewCell)
}

class DeviceTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var deviceTextLabel: UILabel!
    @IBOutlet weak var isOnSwitch: UISwitch!
    
    // MARK: - Properties
    var delegate: DeviceTableViewCellDelegate?
    
    // MARK: - Functions
    func updateUI(device: Device) {
        deviceTextLabel.text = device.name
        isOnSwitch.isOn = device.isOn
    }
    
    // MARK: - Actions
    @IBAction func isOnSwitchTapped(_ sender: Any) {
        delegate?.isOnSwitchToggled(cell: self)
    }
} //End of class
