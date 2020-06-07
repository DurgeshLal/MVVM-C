//
//  SchoolSatViewModel.swift
//  MVVM-C
//
//  Created by Durgesh Lal on 6/6/20.
//  Copyright © 2020 Durgesh Lal Gupta. All rights reserved.
//

import Foundation

protocol SchoolSatViewModeling {
    associatedtype Item
    var data: DynamicValue<[Item]> { get }
    func fetchSatScore()
}

class SchoolSatViewModel: SchoolSatViewModeling {
    private var dataManager: DataManaging
    
    typealias Item = SchoolSat
    var data: DynamicValue<[SchoolSat]> = DynamicValue([])
    
    required init(_ dataManager: DataManaging = HomeDataManager()) {
        self.dataManager = dataManager
        fetchSatScore()
    }
    
    func fetchSatScore() {
        dataManager.getSatScore { [weak self] (response, error) in
            guard let self = self else { return }
            guard let sat = response as? [SchoolSat] else { print(error?.localizedDescription ?? "");  return }
            self.data.value = sat
        }
    }
}
