//
//  AddViewController.swift
//  INFO6125Project2
//
//  Created by Sampath Bandara on 2022-08-08.
//

import UIKit
import CoreLocation

class AddViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // related to get the current location
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        //locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func displayLocation(location: String) {
        locationLabel.text = location
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
