//
//  Somefunctionality1Coordinator.swift
//  CoordinatorPattern
//
//  Created by Richard Simpson on 09/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class SomeFunctionality1Coordinator : Coordinator {
    weak var parentCoordinator : MainCoordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }

    func start() {
        let vc = SomeFunctionality1ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinishSomeFunctionality1() {
//        parentCoordinator!.childDidFinish(self)
//    }
}
