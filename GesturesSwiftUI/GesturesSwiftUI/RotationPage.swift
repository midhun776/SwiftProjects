//
//  RotationPage.swift
//  GesturesSwiftUI
//
//  Created by DDUKK on 28/10/24.
//

import SwiftUI

struct RotationPage: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Image("compass")
            .resizable()
            .frame(width: 300, height: 300)
            .rotationEffect(currentAmount+finalAmount)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        currentAmount = value
                    })
                    .onEnded({ value in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    })
            )
    }
}

struct RotationPage_Previews: PreviewProvider {
    static var previews: some View {
        RotationPage()
    }
}
