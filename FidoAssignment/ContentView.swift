//
//  ContentView.swift
//  FidoAssignment
//
//  Created by אהרן שלמה אדלמן on 03/08/2022.
//

import SwiftUI

let API_KEY = "409c464bc7164c6b874a20e5b048e4e3"

struct ContentView: View {
    var model: FCResult?
    
    var body: some View {
        List {
            if model == nil {
                Text("Please wait…")
            } else {
                Text(model!.status)
                Text("\(model!.totalResults)")
            }
        }
        .onAppear() {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
