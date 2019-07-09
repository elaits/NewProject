//
//  NetworkingSrvice.swift
//  NewProject
//
//  Created by user on 7/1/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class NetworkManager {
    static let scheme = "https"
    static let host = "jsonplaceholder.typicode.com"
    
    static func fetch(path: String, params : [String: String]? = [:], failure: @escaping (Error) -> Void, success: @escaping (Data) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        if let params = params, !params.isEmpty {
            var  arrayQueryItems = [URLQueryItem]()
            for (param, value)  in params {
                let queryItems = URLQueryItem(name: param, value: value)
                arrayQueryItems.append(queryItems)
            }
            urlComponents.queryItems = arrayQueryItems
        }
        
        guard let url = urlComponents.url else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                failure(error)
            }
            guard let data = data else { return }
            success(data)
            }.resume()
    }
}
