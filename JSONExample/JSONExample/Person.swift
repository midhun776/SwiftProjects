//
//  Person.swift
//  JSONExample
//
//  Created by DDUKK on 22/10/24.
//

import Foundation

struct Person: Codable, Identifiable{
    var id = UUID()
    var firstName,lastName,gender,number: String
    var age: Int
    var address: Address
    enum CodingKeys: CodingKey{
        case firstName,lastName,gender,number
        case age
        case address
    }
}

struct Address: Codable{
    var houseName, street, pinCode: String
}
