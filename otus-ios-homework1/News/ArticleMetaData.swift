//
//  ArticleMetaData.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 25.08.21.
//

import SwiftUI
import NewsAPI

struct ArticleMetaData: View {
    @EnvironmentObject var navigationController: NavControllerViewModel
    var article: Article
    
    func tableRow(title: String, text: String?) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(text ?? "N/A")
        }
    }
    
    var body: some View {
        VStack {
            Text(article.title ?? "No title")
                .font(.title)
                .padding(.bottom)
            
            tableRow(title: "Author", text: article.author)
            tableRow(title: "Published at", text: article.publishedAt)
            
            Button(action: { navigationController.pop() }) {
                Text("Back")
            }.padding(.vertical)
            
            Button(action: { navigationController.pop(to: .root) }) {
                Text("Root")
            }
            
            Spacer()
        }
        .padding()
    }
}
