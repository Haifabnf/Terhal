//
//  mapView.swift
//  Terhal
//
//  Created by haifa alfoiz on 21/12/2023.
//

import SwiftUI
import MapKit

struct mapView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        ZStack{
            Color("60")
                .ignoresSafeArea()
            VStack{
                
                
                GeometryReader{ geometry in
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
                        .position(x: geometry.size.width / 11, y: geometry.size.height / 8)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .padding()
                        //.frame(width: 350, height: 300)
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height / 2.6) // Adjust the size here
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2.8)
                        .overlay{
                            Map(coordinateRegion: $region)
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height / 2.8) // Adjust the size of the map here
                                .position(x: geometry.size.width / 2, y: geometry.size.height / 2.8)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    VStack{
                        Text("Emergency contact numbers")
                            .accessibilityLabel("Emergency contact numbers")
                            .font(.custom("SF Arabic Rounded", size: 25))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .position(x: geometry.size.width * 0.44, y: geometry.size.height / 1.8)
                            .padding()
                        
                        HStack (spacing: 10){
                            Text("📞 Emergencies")
                                .font(.custom("SF Arabic Rounded", size: 17))
                            Text("911")
                                .font(.custom("SF Arabic Rounded", size: 17))
                                .foregroundColor(Color("10"))
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        }
                        .position(x: geometry.size.width / 1.7, y: geometry.size.height / 7.5)
                        
                        
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
