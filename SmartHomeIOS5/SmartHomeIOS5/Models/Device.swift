//
//  Device.swift
//  SmartHomeIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import Foundation

class Device {
    
    var name: String
    var isOn: Bool
    let uuid: UUID
    
    init(name: String, isOn: Bool = false, uuid: UUID = UUID()) {
        self.name = name
        self.isOn = isOn
        self.uuid = uuid
    }
} //End of class

// MARK: - Extensions
extension Device: Equatable {
    static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
