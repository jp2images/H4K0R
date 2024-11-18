//
//  DetailView.swift
//  H4X0R
//
//  Created by Jeff Patterson on 11/17/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url:String?
    
    var body: some View {
        WebView(urlSting: url)
    }
}



#Preview {
    DetailView(url:"https://www.google.com")
}
