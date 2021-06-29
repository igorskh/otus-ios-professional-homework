//
//  AboutScreen.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 17.06.21.
//

import SwiftUI

struct AboutScreen: View {
    @State var showLicenses: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Demo App")
            
            Button{
                showLicenses.toggle()
            } label: {
                Text("Licenses")
            }
            .sheet(isPresented: $showLicenses, content: {
                LicensesScreen(isPresented: $showLicenses)
            })
        }
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
