//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    static let shared = AppCoordinator()
    var rootNavController: UINavigationController!
    
    private init() {}
    
    func start() {
        let coordinator = MapCoordinator(appCoordinator: self)
        coordinator.start()
        rootNavController = coordinator.navigationController
    }
}
