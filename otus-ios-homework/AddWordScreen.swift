//
//  AddWordScreen.swift
//  otus-ios-homework
//
//  Created by Igor Kim on 13.10.21.
//

import SwiftUI

struct AddWordScreen: View {
    @EnvironmentObject var suffixCounter: SuffixCounterService
    
    @State var text: String = ""
    
    func submitText() {
        suffixCounter.addWord(text)
        
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
                ForEach(suffixCounter.words, id: \.self) {
                    Text($0)
                }
                .onDelete(perform: suffixCounter.removeWord)
            }
        }
        .padding()
    }
}
