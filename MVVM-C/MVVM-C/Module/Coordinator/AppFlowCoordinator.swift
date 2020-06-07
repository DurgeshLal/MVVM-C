//
//  AppFlowCoordinator.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit
import Foundation

protocol FlowCoordinating {
    func start()
    func finish()
}

protocol AppFlowCoordinating: FlowCoordinating {
    func coordinateToDetailWithItem(_ item: School)
}

extension AppFlowCoordinating {
    func coordinateToDetailWithItem(_ item: School) { }
}

class AppFlowCoordinator: AppFlowCoordinating {
    
    private var navigationController: UINavigationController?
    
    private func coordinateToSchoolSat() {
        let controller = SatViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func coordinateToSchoolList() {
        let viewModel = HomeViewModel()
        let homeViewController = HomeViewController(viewModel,delegate: self)
        navigationController?.setViewControllers([homeViewController], animated: false)
    }
    
    
    required init(_ contex: UINavigationController?) {
        self.navigationController = contex
    }
    
    func start() {
        coordinateToSchoolList()
    }
    
    func coordinateToDetailWithItem(_ item: School) {
        coordinateToSchoolSat()
    }
    
    func finish() {
        navigationController = nil
    }
}
