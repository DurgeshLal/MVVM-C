//
//  HomeViewModelTest.swift
//  MVVM-CTests
//
//  Created by Durgesh Lal Gupta on 3/17/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import XCTest
@testable import MVVM_C

class HomeViewModelTest: XCTestCase {
    
    var viewModel: HomeViewModel!
    var dataManager: HomeMockDataManager!
    
    override func setUp() {
        dataManager = HomeMockDataManager()
        viewModel = HomeViewModel(dataManager)
        //viewModel.fetchSchoolList { }
    }
    
    override func tearDown() {
        dataManager = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchSchoolList() {
//        viewModel.fetchSchoolList {
//            XCTAssertTrue(self.viewModel.numberOfRows == 3, "Invalid number of rows")
//        }
    }
    
    func testNumberOfRows() {
        XCTAssertTrue(self.viewModel.numberOfRows == 3, "Invalid number of rows")
    }
    
    func testDataForRowAtIndexPath() {
        let object = viewModel.dataForRowAtIndexPath(IndexPath(row: 0, section: 0))
        XCTAssertTrue(object.schoolTitle == "Clinton  School Writers", "Invalid school title")
        XCTAssertTrue(object.schoolDescription == "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform.", "Invalid school description")
    }
}
