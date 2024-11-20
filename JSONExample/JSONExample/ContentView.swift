//
//  ContentView.swift
//  JSONExample
//
//  Created by DDUKK on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var personViewModel:PersonViewModel = PersonViewModel()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(personViewModel.persons){
                        person in
                        NavigationLink {
                            UserDetails(personData: person)
                        } label: {
                            Text(person.firstName)
                        }

                    }
                }
            }.navigationTitle("Persons list")
        }.environmentObject(personViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
