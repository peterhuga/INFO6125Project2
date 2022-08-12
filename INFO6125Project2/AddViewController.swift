//
//  AddViewController.swift
//  INFO6125Project2
//
//  Created by Sampath Bandara on 2022-08-08.
//

import UIKit
import CoreLocation

class AddViewController: UIViewController {
    
    @IBOutlet weak var figureInput: UITextField!
    
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var moneyTypePicker: UIPickerView!
    
    @IBOutlet weak var moneyTypeLabel: UILabel!
    
    
    private let locationManager = CLLocationManager()
    let pickerData = ["Grocery", "Transportation", "Education", "Entertainment", "Garments", "Health"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //Data for moneyTypePicker and connect them
        self.moneyTypePicker.delegate = self
        self.moneyTypePicker.dataSource = self
        
        
        // Do any additional setup after loading the view.
        
        // related to get the current location
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        //locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
    
    private func displayLocation(location: String) {
        print(location)
    }
    
    @IBAction func incomeButtonTapped(_ sender: Any) {
        //Once selected, disable and enable Expense button
        incomeButton.isEnabled = false
        expenseButton.isEnabled = true
        moneyTypeLabel.text = "This is an income"
        
        
    }
    @IBAction func expenseButtonTapped(_ sender: Any) {
        
        incomeButton.isEnabled = true
        expenseButton.isEnabled = false
        moneyTypeLabel.text = "This is an expense"
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "goToHistory", sender: self)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //
    
}

// related to get the current location
extension AddViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            displayLocation(location: "(\(latitude),\(longitude))")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error happened with location tracking")
    }
}

extension AddViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
