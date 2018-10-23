//
//  CountryController.swift
//  CountryList_iOS22
//
//  Created by Ivan Ramirez on 10/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

class CountryCountroller {
    
    // NOTE: -
    static let shared = CountryCountroller()
    
    var countries = [Country]()
    
    // NOTE: - creates a true singleton
    private init() {}
    
    // Step: 1) Base URL
    let baseURL = URL(string: "https://restcountries.eu/rest/v2")
    
    // NOTE: - makes your own type, typealias. we can use this call in other areas
    typealias fetchCountryCompletion = ([Country]?, NetworkingError?) -> Void
    
    
    // MARK: - 
    // NOTE: - if you wanted to search you would include it in the completion
    func fetchCountries(completion: @escaping fetchCountryCompletion) {
        
        // NOTE: - the dot is a short cut and you dont need the enum name
        completion(nil, .badBaseURL("Fix URL") )
        guard let unwrappedURL = baseURL else {fatalError("\n\nBad Base URL do not continue\n\n")
        }
        
        let builtURL = unwrappedURL.appendingPathComponent("all")
        
        // NOTE: - with regualr with: URL it has "GET" built inot it
        // NOTE: - with 'with: requestURL you need to specify the HTT Body
        URLSession.shared.dataTask(with: builtURL ) { (data, _, error) in
            if let error = error {
                print("\n\n🚀 There was an error with dataTask in:\(#file)\n\n\(#function); \n\n\(error); \n\n\(error.localizedDescription) 🚀\n\n")
                completion(nil, .forwardedError(error)); return
            }
            guard let data = data else { completion(nil, .invalidData("invalid data")); return}
            
            // NOTE: - Do Try Catch Deecode
            do {
                
                let countries = try JSONDecoder().decode([Country].self, from: data)
                // NOTE: - its going to fill itself with the decodeable local array with the countires that came back
                self.countries = countries
                completion(countries, nil)
                
            } catch let error {
                print("\n\n🚀 There was an error with JSONDEcoder in:\(#file)\n\n\(#function); \n\n\(error); \n\n\(error.localizedDescription) 🚀\n\n")
                completion(nil, .forwardedError(error)); return
            }
            
        }.resume()
    }//Last for Fetch
    
} // Last
