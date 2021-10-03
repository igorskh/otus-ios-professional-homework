//
//  LicensesScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

struct LicensesScreen: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Nothing here")
            }
            .toolbar(content: {
                Button("Close", action: {isPresented = false})
            })
        }
    }
}

struct LicensesScreen_Previews: PreviewProvider {
    static var previews: some View {
        LicensesScreen(isPresented: .constant(true))
    }
}
