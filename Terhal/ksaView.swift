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
                
                GeometryReader{ geometry in
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
                    
                    Rectangle()
                        .fill(Color("10"))
                        .frame(width: geometry.size.width, height: geometry.size.height / 4.5)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.06)
                        .shadow(radius: 3)
                        .edgesIgnoringSafeArea(.all)
                        
                    Text("KSA")
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
                                .onAppear{
                                    viewModel.checkIfLocationServicesIsEnabled()
                                }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
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
