import SwiftUI
import MapKit

struct HomeView: View {

    var body: some View {
        VStack {
            // Header with icons
            HStack {
                Button(action: {
                    // Search action
                }) {
                    Image(systemName: "person.crop.circle.fill") // User icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundColor(Color("TabButtonAccentColor"))
                        .padding(.leading)
                }
                

                Spacer()
                
                Button(action: {
                    // Search action
                }) {
                    Image(systemName: "magnifyingglass.circle.fill") // User icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundColor(Color("TabButtonAccentColor"))
                        .padding(.leading)
                }

                Button(action: {
                    // Account action
                }) {
                    Image(systemName: "gear") // User icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundColor(Color("TabButtonAccentColor"))
                        .padding(.leading)
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            // Title of Page
            Text("Jobs")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            

            // Job Listings
            List(jobs, id: \.title) { job in
                HStack {
                    AsyncImage(url: job.logoURL) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(job.title)
                            .fontWeight(.bold)
                        Text("Details about the job...")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 8)
            }


            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

