//
//  ContentView.swift
//  otus-ios-homework
//
//  Created by Igor Kim on 03.10.21.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var words: [String] = []
    
    func submitText() {
        SuffixSequence(string: text).forEach {
            print($0)
        }
        words.append(text)
        
        text = ""
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a word", text: $text, onCommit: { submitText() })
                Button {
                    submitText()
                } label: { Image(systemName: "plus").font(.title2) }
            }
            Spacer()
            List {
                ForEach(words, id: \.self) {
                    Text($0)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
