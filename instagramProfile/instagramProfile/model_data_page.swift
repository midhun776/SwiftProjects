//
//  model_data_page.swift
//  instagramProfile
//
//  Created by DDUKK on 17/10/24.
//

import SwiftUI

struct model_data_page: View {
    var userData: dataModel = dataModel(name: "Midhun",age: 0,description: "CEO")
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            Text(userData.name).font(.system(size: 30))
            Text(userData.id).font(.system(size: 15))
            Text(userData.description)
        }
    }
}

struct model_data_page_Previews: PreviewProvider {
    static var previews: some View {
        model_data_page()
    }
}
