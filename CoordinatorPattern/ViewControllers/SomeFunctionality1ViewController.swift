//
//  SomeFunctionality1ViewController.swift
//  CoordinatorPattern
//
//  Created by Richard Simpson on 09/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class SomeFunctionality1ViewController: UIViewController, Storyboarded {
    weak var coordinator : SomeFunctionality1Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinishSomeFunctionality1()
//    }

}
