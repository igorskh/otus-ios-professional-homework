//
//  CustomButton.swift
//  otus-ios-professional
//
//  Created by Igor Kim on 05.12.21.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label: "Test", action: {})
    }
}
