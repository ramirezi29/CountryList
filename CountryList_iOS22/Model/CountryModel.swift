//
//  CountryModel.swift
//  CountryList_iOS22
//
//  Created by Ivan Ramirez on 10/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

// Decodable because its Read-Only
// Decodable, can read the JSon
struct Country: Decodable {
    let name: String
    let population: Int
   // NOTE: -  dont have to take the image into a String . Swift will recognize it bc it has the https in the json
    let flag: URL
}
