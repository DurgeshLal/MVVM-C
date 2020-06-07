//
//  HomeViewModel.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import Foundation

protocol ViewModeling: class { }

protocol HomeViewModeling: ViewModeling {
    ///ViewModel data
    associatedtype Item
    var data: DynamicValue<[Item]> { get }
    
    ///TableVeiw DataSource
    var numberOfRows: Int { get }
    func itemAt(_ indexPath: IndexPath) -> Item
    func dataForRowAtIndexPath(_ indexPath: IndexPath) -> SchoolViewModel
}


class HomeViewModel: HomeViewModeling {
    
    typealias Item = School
    var data: DynamicValue<[School]> = DynamicValue([])
    
    ///Private scope
    ///HomeViewModel takes a mandatory parameter DataManaging
    private var dataManager: DataManaging
    //private var schoolList: [School] = []
    
    private func fetchSchoolList() {
        dataManager.fetchSchoolList { [weak self] (response, error) in
            guard let self = self else { return }
            guard let list = response as? [School] else { print(error?.localizedDescription ?? ""); return }
            self.data.value = list
        }
    }
    
    ///Default value set to dataManager is HomeDataManager
    ///Pass your own dataManager based on need
    required init(_ dataManager: DataManaging = HomeDataManager()) {
        self.dataManager = dataManager
        fetchSchoolList()
    }
}

extension HomeViewModel {
    
    var numberOfRows: Int {
        return data.value.count
    }
    
    func dataForRowAtIndexPath(_ indexPath: IndexPath) -> SchoolViewModel {
        return SchoolViewModel(data.value[indexPath.row])
    }
    
    func itemAt(_ indexPath: IndexPath) -> School {
        return data.value[indexPath.row]
    }
}

