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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8.0) {
                let urlToImage = article.urlToImage
                if urlToImage != nil {
                    AsyncImage(url: URL(string: urlToImage!)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 128, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
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
                
                let urlString = article.url
                let url = URL(string: urlString)
                if url != nil {
                    Link("🔗 Link", destination: url!)
                }
            }
            .padding()
        }
    }
}

//struct FCArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        FCArticleView()
//    }
//}
