//
//  SchoolViewModel.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/17/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import Foundation

class SchoolViewModel: ViewModeling {
    
    private var school: School
    
    required init(_ school: School) {
        self.school = school
    }
    
    var schoolTitle: String? {
        return school.school_name
    }
    
    var schoolDescription: String? {
        return school.overview_paragraph
    }
}
