//
//  ContentView.swift
//  Terhal
//
//  Created by haifa alfoiz on 19/12/2023.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var ksaPage = false
    @State private var usaPage = false

    var text: String = "Choose the country you’re willing to go to and look through sketchy places to avoid, you can also find emergency contact numbers."
    
    var body: some View {
        NavigationView {
            ZStack{
                
                Color("60")
                    .ignoresSafeArea()
                
                VStack(spacing: 0){
                    //GeometryReader { geometry in
                        Image("Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .accessibilityLabel("a girl traveling illustration")
                        
                        Text("Choose the country you’re willing to go to and look through sketchy places to avoid, you can also find emergency contact numbers.")
                            //.accessibilityLabel("Choose the country you’re willing to go to and look through sketchy places to avoid, you can also find emergency contact numbers.")
                            .padding()
                            .font(.custom("SF Arabic Rounded", size: 17))
                    
                    GeometryReader { geometry in

                        Text("Choose a country")
                            .accessibilityLabel("Choose a country")
                            .font(.custom("SF Arabic Rounded", size: 25))
                            .fontWeight(.bold)
                            //.frame(height: 650)
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                    .frame(width:380, height:50)
                    //Spacer()
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 13){
                            
                            //Countries:
                            
                            NavigationLink(destination: ksaView(), isActive: $ksaPage){
                                Button{
                                    self.ksaPage = true
                                }label:{
                                    HStack{
                                        Image("ksa")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        Text("KSA")
                                            .font(.custom("SF Arabic Rounded", size: 17))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .buttonStyle(flagButton())
                            }
                            NavigationLink(destination: mapView(), isActive: $usaPage){
                                Button{
                                    self.usaPage = true
                                }label:{
                                    HStack{
                                        Image("usa")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        Text("USA")
                                            .font(.custom("SF Arabic Rounded", size: 17))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .buttonStyle(flagButton())
                            }
                            
                            
                            Button{
                                
                            }label:{
                                HStack{
                                    Image("uk")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("UK")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .buttonStyle(flagButton())
                            
                            Button{
                                
                            }label:{
                                HStack{
                                    Image("france")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("France")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .buttonStyle(flagButton())
                            
                            Button{
                                
                            }label:{
                                HStack{
                                    Image("italy")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("Italy")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .buttonStyle(flagButton())
                            
                            Button{
                                
                            }label:{
                                HStack{
                                    Image("uae")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("UAE")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .buttonStyle(flagButton())
                            
                            Button{
                                
                            }label:{
                                HStack{
                                    Image("turkey")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("Turkey")
                                        .font(.custom("SF Arabic Rounded", size: 17))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .buttonStyle(flagButton())
                            
                        }
                        .padding()
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //.frame(height: 350)
                }
                //   .padding()
                
            }
        }
    }
}

#Preview{
    MainScreen()
}

#Preview{
    MainScreen()
        .environment(\
            .locale,
            .init(identifier: "ar"))
}

struct flagButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("30"))
            .foregroundStyle(Color.black)
            .font(.custom("SF Arabic Rounded", size: 17))
            .frame(width: 350, height: 50)
            .cornerRadius(19)
            .shadow(color: Color("shadow"), radius: 10, x: 1, y: 3)

            
    }
}
