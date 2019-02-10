//
//  ViewController.swift
//  CoordinatorPatters
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func gotoDemoScreen2(_ sender: UIButton) {
        coordinator?.viewControllerDemoScreen2(products: nil)
    }
    
    @IBAction func gotoDemoScreen3(_ sender: UIButton) {
        coordinator?.viewControllerDemoScreen3()
    }
    
    @IBAction func gotoDemoScreen4(_ sender: Any) {
        coordinator?.viewControllerDemoScreen4()
    }
    
    @IBAction func gotoDemoScreen6(_ sender: Any) {
        coordinator?.viewControllerDemoScreen6()
    }
    @IBAction func gotoViewContollerWithChildCoordinator(_ sender: Any) {
        coordinator?.SomeFunctionality1ViewController()
    }
}

