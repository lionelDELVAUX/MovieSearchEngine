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
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let homeViewModel = HomeViewModel()
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController else { return }
        homeViewModel.coordinator = self
        homeViewController.viewModel = homeViewModel
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
