import SwiftUI

struct SplashView: View {
    @State private var imageOpacity: Double = 1.0
    @State var isActive: Bool = false

    var body: some View {
        if self.isActive{
            ContentView()
        }else{
            ZStack {
                // Image as the background
                Image("terh")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(imageOpacity)
                    .animation(.easeInOut(duration: 1.5)) // Adjust the duration as needed
                
                
                
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        //self.imageOpacity = 0.0
                        self.isActive = true
                        
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
