//
//  HomeViewModel.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import Foundation

protocol ViewModeling {
//    associatedtype DataType
//    var viewModel: DataType { get set }
}

class BaseViewModel: ViewModeling {
   
    var reloadData: (() -> Void)?
    var updateLoadingStatus: (() -> Void)?

    var isLoading: Bool = false {
        didSet {
            updateLoadingStatus?()
        }
    }
}

class HomeViewModel: BaseViewModel {
    
    private var dataManager: DataManaging
    private var schoolList: [School] = [] {
        didSet {
            reloadData?()
        }
    }
    
    required init(_ dataManager: DataManaging = HomeDataManager()) {
        self.dataManager = dataManager
    }
    
    func fetchSchoolList(_ callBack: @escaping () -> Void) {
        isLoading = true
        dataManager.fetchSchoolList { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            strongSelf.isLoading = false
            guard let list = response as? [School] else {
                print(error?.localizedDescription ?? "")
                return
            }
            strongSelf.schoolList = list
            callBack()
        }
    }
}

extension HomeViewModel {
    
    var numberOfRows: Int {
        return schoolList.count
    }
    
    func dataForRowAtIndexPath(_ indexPath: IndexPath) -> SchoolViewModel {
        return SchoolViewModel(schoolList[indexPath.row])
    }
    
    func schoolAt(_ indexPath: IndexPath) -> School {
        return schoolList[indexPath.row]
    }
}



class SchoolSatViewModel: BaseViewModel {
    
    private var dataManager: DataManaging
    private var schoolSat: [SchoolSat] = [] {
        didSet {
            reloadData?()
        }
    }
    
    required init(_ dataManager: DataManaging = HomeDataManager()) {
        self.dataManager = dataManager
    }
    
    func fetchSatScore(_ callBack: @escaping () -> Void) {
        isLoading = true
        dataManager.getSatScore { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            strongSelf.isLoading = false
            guard let sat = response as? [SchoolSat] else {
                print(error?.localizedDescription ?? "")
                return
            }
            strongSelf.schoolSat = sat
            callBack()
        }
    }
}
