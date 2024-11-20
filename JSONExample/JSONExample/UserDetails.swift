//
//  UserDetails.swift
//  JSONExample
//
//  Created by DDUKK on 22/10/24.
//

import SwiftUI

struct UserDetails: View {
    var personData:Person
    let url = URL(string: "https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?b=1&s=612x612&w=0&k=20&c=hEPh7-WEAqHTHdQtPrfEN9-yYCiPGKvD32VZ5lcL6SU=")
    var body: some View {
        VStack{
            AsyncImage(url: url) { img in
                img.resizable().aspectRatio(contentMode: ContentMode.fill).frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }

            HStack{
                Text("\(personData.firstName) \(personData.lastName)").font(.system(size: 35))
                Spacer()
                VStack{
                    Text(String(personData.age)).font(.system(size: 15))
                    Text(personData.gender).font(.system(size: 15))
                }
            }
            Divider()
            HStack(alignment: VerticalAlignment.firstTextBaseline){
                Text("Address:").font(.system(size: 15))
                VStack(alignment: HorizontalAlignment.leading){
                    Text(personData.address.houseName).font(.system(size: 20))
                    Text(personData.address.street).font(.system(size: 20))
                    Text(personData.address.pinCode).font(.system(size: 20))
                }
                Spacer()
            }
            Spacer()
        }.padding(30)
        
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetails(personData: Person(firstName: "Midhun", lastName: "Murali", gender: "Male", number: "", age: 22, address: Address(houseName: "Vidhyanagar", street: "Second Street", pinCode: "682022")))
    }
}
