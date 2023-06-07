//
//  DevicesTableViewController.swift
//  SmartHomeIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import UIKit

class DevicesTableViewController: UITableViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func addDeviceButtonTapped(_ sender: Any) {
        presentAlertController()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DeviceController.sharedInstance.devices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }

        let device = DeviceController.sharedInstance.devices[indexPath.row]
        cell.updateUI(device: device)
        cell.delegate = self

        return cell
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    // MARK: - Functions
    func presentAlertController() {
        let alertController = UIAlertController(title: "New Device Name", message: "Enter the name of your device below", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                  let name = contentTextField.text else { return }
            DeviceController.sharedInstance.createDevice(name: name)
            self.tableView.reloadData()
        }
        
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //End of class

// MARK: - Extensions
extension DevicesTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchToggled(cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let device = DeviceController.sharedInstance.devices[indexPath.row]
        DeviceController.sharedInstance.switchIsOn(device: device)
        cell.updateUI(device: device)
    }
} //End of class
