//
//  PersonViewModel.swift
//  JSONExample
//
//  Created by DDUKK on 22/10/24.
//

import Foundation
import SwiftUI

class PersonViewModel: ObservableObject{
    @Published var persons = [Person]()
    init(){
        addPerson()
    }
    
    func addPerson(){
        guard let url = Bundle.main.url(forResource: "jsonData", withExtension: "json") else {
            return
        }
        let jsonData = try! Data(contentsOf: url)
        persons = try! JSONDecoder().decode([Person].self, from: jsonData)
    }
}
