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
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController else { return }
        let homeViewModel = HomeViewModel(coordinator: self, delegate: homeViewController)
        homeViewModel.coordinator = self
        homeViewController.viewModel = homeViewModel
        self.navigationController.pushViewController(homeViewController, animated: true)
    }
}
