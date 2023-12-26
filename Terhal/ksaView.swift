//
//  mapView.swift
//  Terhal
//
//  Created by haifa alfoiz on 21/12/2023.
//

import SwiftUI
import MapKit

struct ksaView: View {
    
    // beetna 24.778154 46.699431
    // academy 24.8612913 46.7256706
    // riyadh 24.7134319 46.6752310
    
    @Environment(\.dismiss) private var dismiss
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 24.7134319, longitude: 46.6752310),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1))
    @StateObject private var viewModel = ksaViewModel()
    
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
                            .frame(width: 400, height: 40)
                        
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
                        
                        
                        Text("KSA")
                            .foregroundColor(.white)
                            .font(.custom("SF Arabic Rounded", size: 25))
                            .fontWeight(.bold)
                        
                    }
                }
                
                HStack{
                    Text("Map")
                        .accessibilityLabel("Map")
                        .font(.custom("SF Arabic Rounded", size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)

                    Spacer()

                }                        
                    .padding()

                
                Map(coordinateRegion: $region)
                    .shadow(color: Color("shadow"), radius: 3, x: 2, y: 5)
                    .frame(width: 350, height: 300) 
                    .onAppear{
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                
                
                VStack{
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
                            HStack{
                                Text("📞 Emergencies")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                Spacer()
                                Text("911")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                    .foregroundColor(Color("10"))
                            }
                            
                            HStack (spacing: 10){
                                Text("📞 Ambulance")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                Spacer()
                                Text("997")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                    .foregroundColor(Color("10"))
                            }
                            
                            HStack (spacing: 10){
                                Text("📞 Civil Defense")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                Spacer()
                                Text("998")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                    .foregroundColor(Color("10"))
                            }
                            HStack (spacing: 10){
                                Text("📞 Kingdom Emergency (without SIM)")
                                    .font(.custom("SF Arabic Rounded", size: 17))
                                Spacer()
                                Text("112")
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
    ksaView()
}

#Preview{
    ksaView()
        .environment(\
            .locale,
            .init(identifier: "ar"))
}

final class ksaViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
        } else {
            print("show alert that this is off, and turn it on")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("your location is denied")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
