//
//  NetworkingSrvice.swift
//  NewProject
//
//  Created by user on 7/1/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class NetworkManager {
    static let domain = "https://jsonplaceholder.typicode.com/"
    
    static func fetch(path: String, params : [String: String]? = [:], failure: @escaping (Error) -> Void, success: @escaping (Data) -> Void) {
        
        var finalUrl = domain + path
        
        
        if let params = params, !params.isEmpty {
            finalUrl += "?"
            for ( param, value)  in params {
                finalUrl += param + "=" + value + "&"
            }
        }
        
        guard let url = URL(string: finalUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                failure(error)
            }
            guard let data = data else { return }
            success(data)
            
            }.resume()
    }
}
