//
//  DeviceController.swift
//  SmartHomeIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import Foundation

class DeviceController {
    
    // MARK: - Properties
    static let sharedInstance = DeviceController()
    var devices: [Device] = []
    
    init() {
      load()
    }
    
    // MARK: - CRUD Functions
    func createDevice(name: String) {
        let device = Device(name: name)
        devices.append(device)
        save()
    }
    
    func switchIsOn(device: Device) {
        device.isOn.toggle()
        save()
    }
    
    func toggleAllDevicesOn() {
        devices.forEach { $0.isOn = true }
        save()
    }
    
    func toggleAllDevicesOff() {
        devices.forEach { $0.isOn = false }
        save()
    }
    
    // MARK: - Persistence
    func save() {
        guard let url = fileURL else { return }
        do {
            let data = try JSONEncoder().encode(devices)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func load() {
        guard let url = fileURL else { return }
        do {
            let data = try Data(contentsOf: url)
            let devices = try JSONDecoder().decode([Device].self, from: data)
            self.devices = devices
        } catch {
            print(error)
        }
    }
    
    private var fileURL: URL? {
        guard let documentsDirector = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirector.appendingPathComponent("devices.json")
        return url
    }
} //End of class
