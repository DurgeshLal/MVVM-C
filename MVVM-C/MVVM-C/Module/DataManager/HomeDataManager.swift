//
//  HomeDataManager.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import Foundation

protocol DataManaging {
    func fetchSchoolList(_ completion: @escaping Completion)
    func getSatScore(_ completion:@escaping Completion)
}

struct HomeDataManager: DataManaging {
    
    func fetchSchoolList(_ completion: @escaping Completion) {
        NetworkManager.shared.getData(NetworkManager.URLString.schoolListUrl.endPoint) { (response, error) in
            if let data = response as? Data {
                self.parseSchool(data, error: error, completion: completion)
            }
        }
    }
    
    private func parseSchool(_ response: Data, error: Error?, completion: @escaping Completion) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode([School].self, from: response)
            print(decoded[0].academicopportunitiesOne ?? "")
            completion(decoded, error)
        } catch {
            completion([], error)
        }
    }
    
    
    func getSatScore(_ completion:@escaping Completion) {
        NetworkManager.shared.getData(NetworkManager.URLString.satScoreListUrl.endPoint) { (response, error) in
            if let data = response as? Data {
                self.parseSat(data, error: error, completion: completion)
            }
        }
    }
    
    private func parseSat(_ response: Data, error: Error?, completion: @escaping Completion) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode([SchoolSat].self, from: response)
            completion(decoded, error)
        } catch {
            print("Failed to decode JSON")
            completion(nil, error)
        }
    }
}
