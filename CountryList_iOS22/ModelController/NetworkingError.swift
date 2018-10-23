//
//  NetworkingError.swift
//  CountryList_iOS22
//
//  Created by Ivan Ramirez on 10/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    // NOTE: - In order to know where your code is breaking
    
    case badBaseURL(String)
    case forwardedError(Error)
    case invalidData(String)
}
