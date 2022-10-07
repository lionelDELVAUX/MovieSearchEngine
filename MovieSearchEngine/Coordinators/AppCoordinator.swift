//
//  AppCoordinator.swift
//  MovieSearchEngine
//
//  Created by Lionel Delvaux on 07/10/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //TODO : Navigate to homePage
    }
}
