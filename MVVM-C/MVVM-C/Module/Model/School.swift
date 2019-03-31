//
//  School.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//


import UIKit
// Important Codable links
//https://medium.com/makingtuenti/indeterminate-types-with-codable-in-swift-5a1af0aa9f3d

struct School: Codable {
    var academicopportunitiesOne: String?
    var academicopportunities2: String?
    var admissionspriority11: String?
    var admissionspriority21: String?
    var admissionspriority31: String?
    var attendance_rate: String?
    var bbl: String?
    var bin: String?
    var boro: String?
    var borough: String?
    var building_code: String?
    var bus: String?
    var census_tract: String?
    var city: String?
    var code1: String?
    var community_board: String?
    var council_district: String?
    var dbn: String?
    var directions1: String?
    var ell_programs: String?
    var extracurricular_activities: String?
    var fax_number: String?
    var finalgrades: String?
    var grade9geapplicants1: String?
    var grade9geapplicantsperseat1: String?
    var grade9gefilledflag1: String?
    var grade9swdapplicants1: String?
    var grade9swdapplicantsperseat1: String?
    var grade9swdfilledflag1: String?
    var grades2018: String?
    var interest1: String?
    var language_classes: String?
    var latitude: String?
    var location: String?
    var longitude: String?
    var method1: String?
    var neighborhood: String?
    var nta: String?
    var overviewParagraph: String?
    var pct_stu_enough_variety: String?
    var pct_stu_safe: String?
    var phone_number: String?
    var primary_address_line_1: String?
    var program1: String?
    var school_10th_seats: String?
    var school_email: String?
    var schoolName: String?
    var school_sports: String?
    var seats101: String?
    var seats9ge1: String?
    var seats9swd1: String?
    var state_code: String?
    var subway: String?
    var total_students: String?
    var transfer: String?
    var website: String?
    var zip: String?
}


extension School {
    
    /// Codable: use different key than api
    ///
    /// - academicopportunitiesOne: local key | api name is academicopportunities1
    /// - schoolName: local name | api name is school_name
    /// - overviewParagraph: lacl name api name is overview_paragraph
    enum CodingKeys: String, CodingKey {
        case academicopportunitiesOne = "academicopportunities1"
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
    }
    /*
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.academicopportunitiesOne = try container.decode(String.self, forKey: .academicopportunitiesOne)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.academicopportunitiesOne, forKey: .academicopportunitiesOne)
    }
 */
}
