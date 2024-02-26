//
//  ParksView.swift
//  kwsapp
//
//  Created by Rayan Popat on 20/06/2023.
//

import SwiftUI
import MapKit

struct JobsView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 54.3781, longitude: -3.4360), // Center on the UK
        span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: jobs) { job in
            MapAnnotation(coordinate: job.location) {
                MapAnnotationView(job: job)
            }
        }
        .navigationBarTitle("Jobs in the UK", displayMode: .inline)
    }
}

struct MapAnnotationView: View {
    @State var isShowingDetail = false
    let job: Job
    
    var body: some View {
        Button(action: {
            self.isShowingDetail.toggle()
        }) {
            Image(systemName: "pin.circle.fill") // Example icon for a job
                .foregroundColor(.red) // Choose a suitable color
                .imageScale(.large)
                .onTapGesture {
                    self.isShowingDetail = true
                }
        }
        .sheet(isPresented: $isShowingDetail, content: {
            JobDetailView(job: job)
        })
    }
}

struct JobDetailView: View {
    let job: Job

    var body: some View {
        VStack {
            Text(job.title)
                .font(.largeTitle).bold()
                .multilineTextAlignment(.center)
                .padding()

            Text("Location: \(job.location.latitude), \(job.location.longitude)")
                .font(.title2)
                .multilineTextAlignment(.leading)
                .padding()
            
            Text("Description:")
            .font(.title2)
            .fontWeight(.bold)

            Text(job.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
                .lineSpacing(8)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}
