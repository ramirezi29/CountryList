//
//  NetworkingController.swift
//  CountryList_iOS22
//
//  Created by Ivan Ramirez on 10/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

class NetworkController {
    
    // MARK: Properties
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    // MARK: -  filling out a blank puzzle, have the completion match in order to be able to reuse it with what you want.
    
    static func performRequest(for url: URL,
                               httpMethod: HTTPMethod,
                               // NOTE: - you can plug in query items. example) query = Jwas
                               urlParameters: [String : String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        
        // Build our entire URL
        
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        // Create and "resume" (a.k.a. run) the task
        
        // NOTE: -
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            completion?(data, error)
        }
        
        dataTask.resume()
    }
    
    static func url(byAdding parameters: [String : String]?,
                    to url: URL) -> URL {
        
        // NOTE: -
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        // NOTE: - the second zero is 'value' $0.0 // the one is the 'key' $0.1
        components?.queryItems = parameters?.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        
        
        return url
    }
}


