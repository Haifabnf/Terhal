//
//  GIFImage.swift
//  Terhal
//
//  Created by Taif on 11/06/1445 AH.
//

import SwiftUI
import WebKit

struct GIFImage: UIViewRepresentable {
    private let name: String
    
    init(_ name: String){
        self.name = name
    }
    
    func makeUIView(context: Context) -> WKWebView {

        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )

        return webView
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {

        uiView.reload()
            

    }
        
   
}

#Preview {
   // GeometryReader { geometry in
    VStack{
        GIFImage("too")
            .aspectRatio(contentMode: .fit)
            .frame(width: 1000, height: 1000)
            .padding()
            .padding()
            .edgesIgnoringSafeArea(.all)
        
    }.padding()
  //  Spacer()
            //}
        
}

