//
//  MapCoordinator.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation
import UIKit

class MapCoordinator: NavigatingCoordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController!
    private weak var appCoordinator: AppCoordinator!
    
    // MARK: - Init
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    // MARK: - Utilities
    
    func start() {
        let vc: MapViewController = UIStoryboard(storyboard: .main).instantiateVC()
        vc.coordinator = self
        navigationController = startRootFlow(viewController: vc)
    }
}
