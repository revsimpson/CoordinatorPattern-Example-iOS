//
//  ViewControllerDemoScreen4.swift
//  CoordinatorPattern
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation

import UIKit

class ViewControllerDemoScreen4: UIViewController, Storyboarded {
    
    var productAction : (([DemoStruct]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func doSomethingWithData() {
        
        // Fill the producAction with data and the Coordinator will do its stuff in the background. So the viewcontrollor knows nothing about its surroundings
        let someData3 : DemoStruct = DemoStruct(title:"Title3",subtitle:"Subtitle3",someExtraStuff:"Some extra stuff 3")
        let someData4 : DemoStruct = DemoStruct(title: "Title4", subtitle: "Subtitle4", someExtraStuff: "Some extra stuff 4")
        
        // Check the coordinator to see what productAction does when it get its data en transitions to Demoscreen 5
        // The magic happens when the productAction is set in the Coordinator
        productAction?([someData3,someData4])
        
    }
    
    @IBAction func sendSomeData(_ sender: Any) {
        
        doSomethingWithData()
    }
    
}
