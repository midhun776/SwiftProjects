//
//  observable_example.swift
//  instagramProfile
//
//  Created by DDUKK on 18/10/24.
//

import SwiftUI

struct observable_example: View {
    @State var current:String = "LOGIN";
    @EnvironmentObject var profile : Profile;
    var body: some View {
        NavigationView{
            VStack{
                Button(current){
                    if current == "LOGIN"{
                        current = "LOGOUT"
                        profile.isLoggedIn = true
                    } else{
                        current = "LOGIN"
                        profile.isLoggedIn = false
                    }
                }
                Text(profile.isLoggedIn ? "User LoggedIn" : "Please LogIn")
                NavigationLink(destination: NextPage()) {
                    Text("Next Page =>")
                }
                
            }
        }
        
    }
}

struct observable_example_Previews: PreviewProvider {
    static var previews: some View {
        observable_example().environmentObject(Profile())
    }
}
