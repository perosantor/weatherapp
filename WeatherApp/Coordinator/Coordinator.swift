//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation
import UIKit

protocol NavigatingCoordinator: Coordinator {
    var navigationController: UINavigationController! { get set }
    func start()
    func pop(animated: Bool)
}

protocol Coordinator {
    func start()
    func startRootFlow(viewController: UIViewController,
                       hideNavBar: Bool) -> UINavigationController
}

extension Coordinator {
    func startRootFlow(viewController: UIViewController,
                       hideNavBar: Bool = false) -> UINavigationController {
        guard let sharedWindow = UIApplication.shared.delegate?.window,
            let window = sharedWindow else { return UINavigationController() }
        
        let navigationController =  UINavigationController()
        navigationController.setNavigationBarHidden(hideNavBar, animated: false)
        navigationController.pushViewController(viewController, animated: true)
        
        window.rootViewController?.present(navigationController, animated: false)
        return navigationController
    }
    
    func finishedFlow(for navigationController: UINavigationController!) {
        guard navigationController != nil else { return }
        navigationController.viewControllers.removeAll()
        navigationController.dismiss(animated: false, completion: nil)
    }
}

extension NavigatingCoordinator {
    func start() { }
    
    func pop(animated: Bool = true) {
        self.navigationController.popViewController(animated: animated)
    }
}
