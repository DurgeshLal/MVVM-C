//
//  NetworkManager.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit
typealias Completion = (Any?, Error?) -> Void

class ApiManager {
    
}

class NetworkManager: NSObject {
    
    enum URLString: String {
        case base = "https://data.cityofnewyork.us/resource/"
        case schoolListUrl = "97mf-9njv.json"
        case satScoreListUrl = "734v-jeq5.json"
        
        var endPoint: String {
            switch self {
            case .schoolListUrl, .satScoreListUrl:
                return "\(URLString.base.rawValue)\(self.rawValue)"
            default:
                return "\(self.rawValue)"
            }
        }
    }
    
    static let shared = NetworkManager()
    
    var completion: Completion?
    
    func getData(_ url: String, completion: @escaping Completion) {
        
        self.completion = completion
        let session = URLSession(configuration: .default)
        
        let baseUrl = String(format:url)
        
        guard let escapedURLString = baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let request = URL(string: escapedURLString) else { return }
        
        session.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                DispatchQueue.main.async {
                    completion(responseData, nil)
                }
            } else {
                completion(nil, error)
            }
            }.resume()
    }
}

