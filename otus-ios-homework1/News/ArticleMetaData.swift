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
            HStack {
                Button(action: { navigationController.pop() }) {
                    Image(systemName: "arrow.backward")
                }
                .padding(.vertical)
                
                Spacer()
            }
            
            Text(article.title ?? "No title")
                .font(.title)
                .padding(.bottom)
            
            tableRow(title: "Author", text: article.author)
            tableRow(title: "Published at", text: article.publishedAt)
            
            Button(action: { navigationController.pop(to: .root) }) {
                Text("To the list")
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
    }
}
