//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation
import UIKit

protocol MainCoordinatorProtocol: AnyObject{
    func viewControllerDemoScreen2(products:[DemoStruct]?)
    func SomeFunctionality1ViewController()
    func viewControllerDemoScreen4()
    func viewControllerDemoScreen3()
    func viewControllerDemoScreen5()
    func viewControllerDemoScreen6()
}

class MainCoordinator: NSObject,Coordinator, UINavigationControllerDelegate,MainCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // The first screen to show in your app
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func SomeFunctionality1ViewController() {
        let child = SomeFunctionality1Coordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
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
        vc.productAction = { [weak self] products in
            
            products.forEach{ print($0.subtitle)}
            self?.viewControllerDemoScreen5()
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewControllerDemoScreen5() {
        let vc = ViewControllerDemoScreen5.instantiate()
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewControllerDemoScreen6() {
        let vc = ViewControllerDemoScreen6.instantiate()
        
        // unowned self will make sure there is no strong reference to the vc
        vc.buttonTappedClosure1 = { [unowned self] in
            print("Goto screen 5 with a closure")
            self.viewControllerDemoScreen5()
        }
        
        // [weak self] will handle self as optional and has no strong reference to vc
        vc.buttonTappedClosure2 =  { [weak self] in
            print("Goto screen 3 with a closure")
            self?.viewControllerDemoScreen3()
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child:Coordinator?){
        for (index, coordinator) in  childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let someFunctionality1Viewcontroller = fromViewController as? SomeFunctionality1ViewController {
            childDidFinish(someFunctionality1Viewcontroller.coordinator)
        }
    }
}
