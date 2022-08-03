//
//  FCArticleView.swift
//  FidoAssignment
//
//  Created by אהרן שלמה אדלמן on 03/08/2022.
//

import SwiftUI

struct FCArticleView: View {
    var article: FCArticle

    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(article.source.name)
                        
            let author = article.author
            if author != nil {
                Text(author!)
            }
            
            Text(article.title)
                .font(.title)
            
            let description = article.articleDescription
            if description != nil {
                Text(description!)
            }
            
            let content = article.content
            if content != nil {
                Text(content!)
            }
        }
        .padding()
    }
}

//struct FCArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        FCArticleView()
//    }
//}
