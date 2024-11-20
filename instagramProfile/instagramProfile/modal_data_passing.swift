//
//  modal_data_passing.swift
//  instagramProfile
//
//  Created by DDUKK on 17/10/24.
//

import SwiftUI

struct dataModel:Identifiable {
    var id: String = UUID().uuidString
    let name:String
    let age:Int
    let description:String
}

struct modal_data_passing: View {
    @State var users:[dataModel] = [
        dataModel(name: "Midhun", age: 22, description: "CEO"),
        dataModel(name: "Alvin", age: 22, description: "DOP"),
        dataModel(name: "Kiran", age: 22, description: "Developer")]
    var body: some View {
        NavigationView{
            List{
                ForEach(users){
                    user in
                    NavigationLink(destination: model_data_page(userData: user)){
                        VStack(alignment: HorizontalAlignment.leading){
                            HStack{
                                Text(user.name).font(.system(size: 25))
                                Text(String(user.age)).font(.system(size: 25))
                            }
                            Text(user.id).font(.system(size: 10))
                            Text(user.description)
                        }.padding()
                    }
                }
            }
        }
    }
}

struct modal_data_passing_Previews: PreviewProvider {
    static var previews: some View {
        modal_data_passing()
    }
}
