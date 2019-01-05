//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // The first screen to show in your app
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func viewControllerDemoScreen2(products:[DemoStruct]?) {
        // Coordinator call with data ... of course you can make an initializer for the vc and add product in the init, but this is just to have an simple example about the pattern
        let vc = ViewControllerDemoScreen2.instantiate()
        vc.coordinator = self
        vc.products = products
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewControllerDemoScreen3() {
        // Basic coordinator call
        let vc = ViewControllerDemoScreen3.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func viewControllerDemoScreen4() {
        let vc = ViewControllerDemoScreen4.instantiate()
        // Before we open Demoscreen4 we set the productAction telling it what to do when it receives data.
        vc.productAction = { products in
    
            products.forEach{ print($0.subtitle)}
            self.viewControllerDemoScreen5()
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewControllerDemoScreen5() {
        let vc = ViewControllerDemoScreen5.instantiate()
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewControllerDemoScreen6() {
        let vc = ViewControllerDemoScreen6.instantiate()
        
        vc.buttonTappedClosure1 = {
            print("Goto screen 5 with a closure")
            self.viewControllerDemoScreen5()
        }
        
        vc.buttonTappedClosure2 =  {
            print("Goto screen 3 with a closure")
             self.viewControllerDemoScreen3()
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
}
