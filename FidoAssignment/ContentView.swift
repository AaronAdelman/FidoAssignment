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
    @State private var error: Error?
    @State private var fetching: Bool = true
    
    @Environment(\.scenePhase) var scenePhase
    
    fileprivate func loadData() {
        self.fetching = true
        
        let API_KEY = "409c464bc7164c6b874a20e5b048e4e3"
        let magicURLString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(API_KEY)" // "Top business headlines in the US right now", which is about as close to "everything" one is going to get without serious study of what the news API can do.
        //        debugPrint(#file, #function, magicURLString)
        AF.request(magicURLString).responseString {
            response
            in
            defer { self.fetching = false }
            self.error = nil
            
            //            debugPrint(#file, #function, response.value as Any)
            if response.data != nil {
                let (result, error) = FCResult.from(response.data!)
                if result != nil {
                    self.model = result
                } else if error != nil {
                    self.error = error
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
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
                    }
                    
                    if self.error != nil {
                        Section {
                            Text(error!.localizedDescription)
                        }
                    }
                                        
                    Section {
                        ForEach(0..<model!.articles.count, id: \.self) {
                            let article = model!.articles[$0]
                            NavigationLink(destination: FCArticleView(article: article)) {
                                FCArticleCell(article: article)
                            }
                        } // ForEach
                    }
                }
            }
            .navigationTitle("Fido Assignment")
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
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    } // var body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
