//
//  WeatherScreen.swift
//  iosAppKMM
//
//  Created by Igor Kim on 28.10.21.
//

import SwiftUI

struct WeatherScreen: View {
    @ObservedObject var viewModel: WeatherScreenViewModel = .init()
    
    var body: some View {
        VStack {
            Text("Search Cities")
                .font(.title)
            
            HStack {
                TextField("Location", text: $viewModel.locationValue)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    viewModel.searchLocation()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            Text("Found \(viewModel.locations.count)")
            Spacer()
            
            List {
                ForEach(viewModel.locations, id: \.self.title) {
                    Text($0.title)
                }
            }
            
        }
    }
}

struct WeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScreen()
    }
}
