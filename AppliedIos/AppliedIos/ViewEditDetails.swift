//
//  ViewEditDetails.swift
//  AppliedIos
//
//  Created by DDUKK on 06/11/24.
//

import SwiftUI

struct ViewEditDetails: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let student: Student
    @State var name: String
    @State var rollNo: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 20){
            VStack(alignment: HorizontalAlignment.leading){
                Text("Student details")
                HStack(spacing: 50){
                    TextField("Username", text: $name)
                        .font(.system(size: 30))
                    TextField("RollNo", text: $rollNo)
                        .font(.system(size: 30))
                }
            }
            VStack(alignment: HorizontalAlignment.leading){
                Text("Teacher details")
                HStack(spacing: 50){
                    Text(student.teacher!.name!).font(.system(size: 30))
                    Text(student.teacher!.subject!).font(.system(size: 30))
                }
            }
            Button("Save Details"){
                student.name = name
                student.roll = Int16(rollNo) ?? 0
                try? viewContext.save()
            }.padding().foregroundColor(.white).background(.orange).cornerRadius(25)
        }.padding(30).background(Color.orange.opacity(0.2)).cornerRadius(20).overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 3)).padding()
    }
}

struct ViewEditDetails_Previews: PreviewProvider {
    static var previews: some View {
        ViewEditDetails(student: Student(), name: "", rollNo: "0")
    }
}
