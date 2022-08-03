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
        VStack(alignment: .leading) {
            HStack {
                Text(article.source.name)
                
                Spacer()
                
                let author = article.author
                if author != nil {
                    Text(author!)
                }
            }
            
            Text(article.title)
                .bold()
            
            let description = article.articleDescription
            if description != nil {
                Text(description!)
            }
        }
    }
}

//struct FCArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        FCArticleView()
//    }
//}
