//
//  DragPage.swift
//  GesturesSwiftUI
//
//  Created by DDUKK on 28/10/24.
//

import SwiftUI

struct DragPage: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        VStack{
            Text("Tap Hold & Drag me Anywhere")
            Circle().frame(width: 100, height: 100).foregroundColor(.blue).scaleEffect(isDragging ? 1.5 : 1).offset(offset).gesture(combined)
        }
    }
}

struct DragPage_Previews: PreviewProvider {
    static var previews: some View {
        DragPage()
    }
}
