//
//  ViewControllerDemoScreen3.swift
//  CoordinatorPattern
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit
 

class ViewControllerDemoScreen3: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinatorProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gotoDemoscreen3(_ sender: Any) {
        // to go to Demoscreen 2 we set some data so you have an example how this works when you want to transfer data over viewcontrollers
        let someData1 : DemoStruct = DemoStruct(title:"Title1",subtitle:"Subtitle1",someExtraStuff:"Some extra stuff 1")
        let someData2 : DemoStruct = DemoStruct(title: "Title2", subtitle: "Subtitle2", someExtraStuff: "Some extra stuff 2")
        coordinator?.viewControllerDemoScreen2(products: [someData1,someData2])
    }
}

