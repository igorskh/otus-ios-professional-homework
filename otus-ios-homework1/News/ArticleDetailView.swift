//
//  ArticleDetailView.swift
//  otus-ios-homework1
//
//  Created by Igor Kim on 25.08.21.
//

import SwiftUI
import NewsAPI

struct ArticleDetailView: View {
    @EnvironmentObject var navigationController: NavControllerViewModel
    var article: Article
    
    var body: some View {
        VStack {
            Text(article.title ?? "")
                .font(.title)
            Text(article.description ?? "")
                .padding(.vertical)
            
            Button(action: {
                    navigationController.push(
                        ArticleMetaData(article: article)
                    )
            }) {
                Text("Meta data")
            }
            
            Button(action: {navigationController.pop()}) {
                Text("Back")
            }.padding(.vertical)
            
            Spacer()
        }
        .padding()
    }
}
