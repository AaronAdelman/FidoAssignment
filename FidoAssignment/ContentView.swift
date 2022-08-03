//
//  ContentView.swift
//  FidoAssignment
//
//  Created by אהרן שלמה אדלמן on 03/08/2022.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State private var model: FCResult?
    @State private var fetching: Bool = true
    
    @Environment(\.scenePhase) var scenePhase
    
    fileprivate func loadData() {
        self.fetching = true

        let API_KEY = "409c464bc7164c6b874a20e5b048e4e3"
        let magicURLString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(API_KEY)"
        debugPrint(#file, #function, magicURLString)
        AF.request(magicURLString).responseString {
            response
            in
            defer { self.fetching = false }
            
            debugPrint(#file, #function, response.value as Any)
            if response.data != nil {
                do {
                    let result = try JSONDecoder().decode(FCResult.self, from: response.data!)
                    print(#file, #function, result)
                    self.model = result
                } catch {
                    print(error)
                }
            }
        }
    }
    
    var body: some View {
        List {
            if fetching {
                Section {
                    ProgressView("Fetching…")
                }
            }
            
            if model != nil {
                let status = model!.status
                if status != "ok" {
                    Section {
                        Text(model!.status)
                    }
                } else {
                    Section {
                        Text("\(model!.totalResults) articles")
                    }
                    
                    Section {
                        ForEach(0..<model!.articles.count, id: \.self) {
                            let article = model!.articles[$0]
                            FCArticleView(article: article)
                        } // ForEach
                    }
                }
            }
        }
        .onAppear() {
            loadData()
        }
        .onChange(of: scenePhase) {
            newPhase
            in
            if newPhase == .active {
                loadData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
