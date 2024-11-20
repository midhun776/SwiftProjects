//
//  ContentView.swift
//  GesturesSwiftUI
//
//  Created by DDUKK on 28/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var displayText1: String = "Click Me Once!"
    @State var displayText2: String = "Double Tap Me!"
    @State var displayText3: String = "Long Press Me!"
    
    @State private var currentAmount = 0.0
        @State private var finalAmount = 1.0
    var body: some View {
        NavigationView{
            VStack{
                Text(displayText1)
                    .padding().onTapGesture {
                        displayText1 = "Label Tapped Once"
                    }
                Text(displayText2)
                    .padding().onTapGesture(count: 2) {
                        displayText2 = "Label Double Tapped"
                    }
                Text(displayText3)
                    .padding().onLongPressGesture {
                        displayText3 = "Label Long Pressed"
                    }
                NavigationLink {
                    RotationPage()
                } label: {
                    Text("Rotation Page")
                        .padding(20).foregroundColor(.black).background(Color.yellow).cornerRadius(10)
                }
                NavigationLink {
                    DragPage()
                } label: {
                    Text("Drag Page")
                        .padding(20).foregroundColor(.black).background(Color.orange).cornerRadius(10)
                }
            }.scaleEffect(currentAmount+finalAmount)
                .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value.magnitude - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
                ).navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
