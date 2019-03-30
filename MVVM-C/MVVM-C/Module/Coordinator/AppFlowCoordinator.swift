//
//  AppFlowCoordinator.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit
import Foundation

protocol FlowCoordinating { }

class AppFlowCoordinator: FlowCoordinating {
    private var controller: UIViewController = UIViewController()
    private var navigationController: UINavigationController?
    
    required init(_ contex: UINavigationController?) {
        self.navigationController = contex
    }
    
    func start() {
        let dataManager = HomeDataManager()
        let viewModel = HomeViewModel(dataManager)
        let homeViewController = HomeViewController(viewModel) { (school) in
            print(school)
            self.gotoSat()
        }
        viewModel.fetchSchoolList {
            self.controller = homeViewController
            self.navigationController?.setViewControllers([self.controller], animated: false)
        }
    }
    
    private func gotoSat() {
        let dataManager = HomeDataManager()
        let viewModel = SchoolSatViewModel(dataManager)
        viewModel.fetchSatScore {
            // GoTo Sat
        }
    }
}
