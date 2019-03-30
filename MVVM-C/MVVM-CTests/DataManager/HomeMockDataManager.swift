//
//  HomeMockDataManager.swift
//  MVVM-CTests
//
//  Created by Durgesh Lal Gupta on 3/17/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import Foundation
@testable import MVVM_C

struct HomeMockDataManager: DataManaging {
    
    func fetchSchoolList(_ completion: @escaping Completion) {
        var schoolOne = School()
        schoolOne.school_name = "Clinton  School Writers"
        schoolOne.overview_paragraph = "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform."
        
        var schoolTwo = School()
        schoolTwo.school_name = "School for Legal Studies"
        schoolTwo.overview_paragraph = "Preparatory Academy for Writers: A College Board School is a small school committed to combining a challenging curriculum with a focus on writing and publishing."
        
        var schoolThree = School()
        schoolThree.school_name = "Brooklyn School for Music & Theatre (BSMT) uses our academic program to accommodate the intellectual, social, and emotional needs of creative high school students."
        schoolThree.overview_paragraph = "Preparatory Academy for Writers: A College Board School is a small school committed to combining a challenging curriculum with a focus on writing and publishing."
       
        completion([schoolOne, schoolTwo, schoolThree], nil)
    }
    
    func getSatScore(_ completion: @escaping Completion) {
        
    }
}
