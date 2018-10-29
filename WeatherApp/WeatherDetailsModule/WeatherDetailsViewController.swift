//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class WeatherDetailsViewController: UIViewController {

    // MARK: - Properties
    
    var location: CLLocationCoordinate2D? = nil
    let service = WeatherDetailsService()
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelCurrentLocationDetails: UILabel! {
        didSet {
            labelCurrentLocationDetails.text = "/"
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        SVProgressHUD.show()
        if let latitude = location?.latitude,
            let longitude = location?.longitude {
            
            service.fetchWeatherData(latitude: "\(latitude)", longitude: "\(longitude)") { (result) in
                switch result {
                case .success(let json):
                    SVProgressHUD.dismiss()
                    print(json)
                    if let weatherDetails = WeatherDetails.parseWeatherDetails(from: json) {
                        self.labelCurrentLocationDetails.text = weatherDetails.desc
                    }

                case .failure(let error):
                    var errorMsg = "error"
                    switch error {
                    case NetworkingError.invalidAPIKey:
                        errorMsg = "invalid_api_key_error".localized
                    default:
                        errorMsg = "default_error_message".localized
                    }
                    SVProgressHUD.showError(withStatus: errorMsg)
                }
            }
        }
    }
}
