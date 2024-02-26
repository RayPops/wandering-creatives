import SwiftUI

struct PortfolioItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

struct PortfolioView: View {
    let portfolioProjects: [PortfolioItem] = [
        PortfolioItem(imageName: "graphic_design", title: "Graphic Design", description: "A comprehensive branding project for a startup."),
        PortfolioItem(imageName: "architecture", title: "Architecture", description: "A collection of my favourite projects demonstrating my architectural skills."),
        PortfolioItem(imageName: "photography", title: "Photography", description: "A collection of nature and landscape photographs."),
        PortfolioItem(imageName: "illustration", title: "Illustration", description: "A series of digital illustrations for a children's book."),
        PortfolioItem(imageName: "animation", title: "2D Animation", description: "A short 2D animated film."),
        PortfolioItem(imageName: "app_design", title: "UI/UX", description: "User interface and user experience design for a mobile application.")
    ]

    @State private var selectedPortfolioItem: PortfolioItem?
    
    var body: some View {
        ScrollView {
            Text("Portfolio")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            LazyVGrid(columns: createColumns(), spacing: 20) {
                ForEach(portfolioProjects) { item in
                    PortfolioTile(item: item)
                        .onTapGesture {
                            selectedPortfolioItem = item
                        }
                }
            }
            .padding()
            .sheet(item: $selectedPortfolioItem) { item in
                PortfolioDetail(item: item)
            }
        }
    }
    
    private func createColumns() -> [GridItem] {
        [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    }
}

struct PortfolioTile: View {
    let item: PortfolioItem
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 175, height: 150)
                .cornerRadius(10)
                .clipped()
            
            Text(item.title)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
    }
}

struct PortfolioDetail: View {
    let item: PortfolioItem
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
            
            Text(item.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(item.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

// For preview
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
