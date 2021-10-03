//
//  TopicsView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 03.10.21.
//

import SwiftUI

struct TopicsView: View {
    @EnvironmentObject var topics: NewsTopicsViewModel
    
    @State var showNewTopicForm: Bool = false
    
    var body: some View {
        HStack {
            Text("Topic:")
            Picker("Topic", selection: $topics.topicIndex) {
                if topics.topics.count == 0 {
                   Text("No topics")
                        .tag(-1)
                } else {
                    ForEach(0..<topics.topics.count, id: \.self) {
                        Text(topics.topics[$0])
                            .tag($0)
                    }
                }
            }
            .disabled(topics.topics.count == 0)
            .pickerStyle(DefaultPickerStyle())
            
            Spacer()
            
            Button(action: {
                topics.removeTopic(name: topics.topics[topics.topicIndex])
            }) {
                Image(systemName: "trash.circle")
                    .font(.title3)
            }.disabled(topics.topics.count == 0)
            
            Button(action: {
                showNewTopicForm.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .font(.title3)
            }
            .sheet(isPresented: $showNewTopicForm) {
                AddNewTopicView()
                    .environmentObject(topics)
            }
        }
        .padding(.horizontal)
    }
}
