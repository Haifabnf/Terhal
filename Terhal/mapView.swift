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
                    
                    VStack{
                        
                        ZStack{
                            Rectangle()
                                .fill(Color("10"))
                                .shadow(radius: 3)
                                .edgesIgnoringSafeArea(.all)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .frame(height: 40)
                            
                            Text("")
                                .navigationBarBackButtonHidden(true)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button {
                                            dismiss()
                                        } label: {
                                            HStack {
                                                
                                                Image(systemName: "chevron.backward")
                                                    .foregroundColor(.white)
                                                Text("Countries")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                }
                            
                            
                            Text("USA")
                                .foregroundColor(.white)
                                .font(.custom("SF Arabic Rounded", size: 25))
                                .fontWeight(.bold)
                            
                        }
                        //Spacer()
                        
                    }
                    HStack{
                        Text("Map")
                            .accessibilityLabel("Map")
                            .font(.custom("SF Arabic Rounded", size: 25))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer()
                    }
                    Map(coordinateRegion: $region)
                        .shadow(color: Color("shadow"), radius: 3, x: 2, y: 5)
                        .frame(width: 350, height: 300)
                        .padding(.horizontal)
                        
                    
                    VStack(spacing: 10){
                        
                        HStack{
                            Text("Emergency contact numbers")
                                .accessibilityLabel("Emergency contact numbers")
                                .font(.custom("SF Arabic Rounded", size: 25))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                        
                        ScrollView{
                            VStack(spacing: 15){
                                HStack (spacing: 10){
                                    Text("📞 Emergencies")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    Text("911")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                    
                                }
                                HStack (spacing: 10){
                                    Text("📞 Public Health & Community Services")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    
                                    Text("211")
                                        .font(.custom("SF-Arabic-Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                }
                                
                                HStack (spacing: 10){
                                    Text("📞 Road & Traffic Conditions")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    
                                    Text("511")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                }
                                
                                HStack (spacing: 10){
                                    Text("📞 Saudi Embassy in NY")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    
                                    Text("+212 342 3800")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                }
                                
                                HStack (spacing: 10){
                                    Text("📞 Saudi Embassy in DC")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    
                                    Text("+202 752 2740")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                }
                                
                                HStack (spacing: 10){
                                    Text("📞 Saudi Embassy in LA")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    
                                    Text("+310 479 6000")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                }
                                
                                HStack (spacing: 10){
                                    Text("📞 Saudi Embassy in TX")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                    Spacer()
                                    
                                    Text("+713 785 5577")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .foregroundColor(Color("10"))
                                }

                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                    Spacer()
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
