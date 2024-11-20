//
//  ContentView.swift
//  AppliedIos
//
//  Created by DDUKK on 13/07/1946 Saka.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.name,ascending: true)],
        animation: .default)
    private var students: FetchedResults<Student>
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Select an item")
                List {
                    ForEach(students) { student in
                        NavigationLink {
                            ViewEditDetails(student: student, name: student.name ?? "", rollNo: String(student.roll))
                        }
                        label: {
                        HStack(spacing:10){
                            Text(student.name!)
                            Text(String(student.roll))
                        }
                        
                        
                    }
                        
                        //    }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Student", systemImage: "plus")
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addItem() {
        withAnimation {
            let newStudent = Student(context: viewContext)
            newStudent.name = "Midhun"
            newStudent.roll = 10
            
            let newTeacher = Teacher(context: viewContext)
            newTeacher.name = "Civiya"
            newTeacher.subject = "English"
            
            newStudent.teacher = newTeacher
            
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { students[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
