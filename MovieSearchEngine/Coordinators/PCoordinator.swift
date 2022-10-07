//
//  PCoordinator.swift
//  MovieSearchEngine
//
//  Created by Lionel Delvaux on 07/10/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController : UINavigationController { get set }
    func start()
}
