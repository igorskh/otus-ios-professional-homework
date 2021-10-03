//
//  AddNewTopicView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 27.09.21.
//
import SwiftUI

struct AddNewTopicView: View {
    @EnvironmentObject var topics: NewsTopicsViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var newTopicLabel: String = ""

    var body: some View {
        Form {
            Section {
                TextField("New topic label", text: $newTopicLabel)
            }
            Section {
                Button(action: {
                    if newTopicLabel.count > 0 {
                        topics.addTopic(name: newTopicLabel)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Create")
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                
            }
        }
    }
    
}
