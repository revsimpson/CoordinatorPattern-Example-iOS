//
//  ViewControllerDemoScreen2.swift
//  CoordinatorPattern
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewControllerDemoScreen2: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    var products : [DemoStruct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We get some data from the previous call and print it here so you have an example how to transfer data between viewcontollers.
        if let products = products {
            products.forEach{ print($0.title) }
        }
    }
    
    @IBAction func gotoDemoScreen3(_ sender: Any) {
        coordinator?.viewControllerDemoScreen3()
    }
}
