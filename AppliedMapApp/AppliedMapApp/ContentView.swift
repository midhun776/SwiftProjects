//
//  ContentView.swift
//  AppliedMapApp
//
//  Created by DDUKK on 19/10/24.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State var annotations = [
        City(name: "Cusat", coordinate: CLLocationCoordinate2D(latitude: 10.0430, longitude: 76.3243)),
        City(name: "HMT", coordinate: CLLocationCoordinate2D(latitude: 10.0612, longitude: 76.3465))
        ]
    
    var body: some View {
        Map(coordinateRegion: viewModel.binding, annotationItems: annotations) {
                    MapAnnotation(coordinate: $0.coordinate) {
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.red
                                    .opacity(0.5))
                            Image(systemName: "location")
                        }
                    }
                }
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                viewModel.checkIfLocationIsEnabled()
            }).navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
