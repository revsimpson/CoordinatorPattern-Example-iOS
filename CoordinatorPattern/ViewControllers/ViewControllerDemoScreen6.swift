//
//  ViewControllerDemoScreen6.swift
//  CoordinatorPattern
//
//  Created by Richard Simpson on 05/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewControllerDemoScreen6: UIViewController, Storyboarded {

    var buttonTappedClosure1 : (() ->())?
    var buttonTappedClosure2 : (() ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        buttonTappedClosure1!()
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        buttonTappedClosure2!()
    }
    
}
