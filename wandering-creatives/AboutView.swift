import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 20) {
                Text("About Wandering Creatives")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Image("about_us_image")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .aspectRatio(contentMode: .fit)
                
                Text("Who We Are")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("We are a dynamic platform founded by an international creatives who understand the challenges of navigating visa-sponsored job opportunities and centralized creative job listings")
                
                Text("Our History")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Born from personal struggles as an international creative, our platform emerged to tackle the challenges of finding creative  visa-sponsored job opportunities and centralized creative listings. We envision a world where talent knows no borders, providing a platform that not only connects creatives with opportunities but also fosters a diverse and vibrant community.")
                
                Text("Our Mission")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("We're here to connect international creatives with global opportunities, simplify the path to pursue their passions, and break down boundaries to inspire creative excellence.")
                
            }
            .padding()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
