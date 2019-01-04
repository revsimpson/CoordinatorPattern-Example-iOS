//
//  Coordinator.swift
//  CoordinatorPatters
//
//  Created by Richard EV Simpson on 04/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
