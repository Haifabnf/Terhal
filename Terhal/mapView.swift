//
//  mapView.swift
//  Terhal
//
//  Created by haifa alfoiz on 21/12/2023.
//

import SwiftUI

struct mapView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            Color("60")
                .ignoresSafeArea()
            VStack{
                
                
                GeometryReader{ geometry in
                    
                    Rectangle()
                        .fill(Color("10"))
                        .frame(width: geometry.size.width, height: geometry.size.height / 4.5)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.06)
                        .shadow(radius: 3)
                        .edgesIgnoringSafeArea(.all)
                        
                    Text("USA")
                        .foregroundColor(.white)
                        .font(.custom("SF Arabic Rounded", size: 25))
                        .fontWeight(.bold)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0)
                    
                    Text("Map")
                        .accessibilityLabel("Map")
                        .font(.custom("SF Arabic Rounded", size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .position(x: geometry.size.width / 6, y: geometry.size.height / 8)
                    Text("")
                        .navigationBarBackButtonHidden(true)
                        // 1
                        .toolbar {

                            // 2
                            ToolbarItem(placement: .navigationBarLeading) {

                                Button {
                                    // action
                                    dismiss()
                                } label: {
                                    // 4
                                    HStack {

                                        Image(systemName: "chevron.backward")
                                            .foregroundColor(.white)
                                        Text("Countries")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        
                }
            }
        }
    }
}

#Preview {
    mapView()
}

#Preview{
    mapView()
        .environment(\
            .locale,
            .init(identifier: "ar"))
}
