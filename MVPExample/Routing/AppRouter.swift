//
//  AppRouter.swift
//  MVPExample
//
//  Created by Dzimtry Navak on 2/23/18.
//  Copyright © 2018 oroom. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    private let window: UIWindow
    private var currentVC: UIViewController!
    private var currentPresentr: UIViewController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showInWindow(viewController: UIViewController) {
        let navController = UINavigationController(rootViewController: viewController)
        if #available(iOS 11.0, *) {
            navController.navigationBar.prefersLargeTitles = true
        }
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
        currentVC = viewController
    }
    
    func showDetailsController(viewController: UIViewController) -> Bool {
        guard let navigationViewcontroller = self.window.rootViewController as? UINavigationController else {
            return false
        }
        navigationViewcontroller.show(viewController, sender: self)
        currentVC = viewController // TODO: not sure if needed
        return true
    }
}
