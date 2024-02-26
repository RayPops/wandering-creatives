//
//  jobs.swift
//  wandering-creatives
//
//  Created by Rayan Popat on 22/11/2023.
//

import Foundation
import MapKit

struct Job: Identifiable {
    let title: String
    let logoURL: URL
    let id = UUID()
    let location: CLLocationCoordinate2D
    var description: String
    }

// Example job data
let jobs = [
    Job(
        title: "Editorial Manager",
        logoURL: URL(string: "https://hirefrequencies.co.uk/wp-content/uploads/2017/05/vogue-logo-square.jpg")!,
        location: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278), // London
        description: "Lead editorial team for a major magazine. Salary: £50,000/year. Term: Permanent."
    ),
    Job(
        title: "UX-UI Internship",
        logoURL: URL(string: "https://images.crunchbase.com/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/v1452886295/ppro72rupgqzznkg9kgg.png")!,
        location: CLLocationCoordinate2D(latitude: 53.4808, longitude: -2.2426), // Manchester
        description: "Internship in UX/UI design. Salary: £20,000/year. Term: 6 months."
    ),
    Job(
        title: "Graphic Designer",
        logoURL: URL(string: "https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-png-transparent-pngpix-14.png")!,
        location: CLLocationCoordinate2D(latitude: 52.4862, longitude: -1.8904), // Birmingham
        description: "Creative graphic designer for marketing campaigns. Salary: £35,000/year. Term: Permanent."
    ),
    Job(
        title: "Furniture Architect",
        logoURL: URL(string: "https://i.pinimg.com/736x/b1/95/c0/b195c09660a711f24ff6ab18d4e79b41.jpg")!,
        location: CLLocationCoordinate2D(latitude: 55.9533, longitude: -3.1883), // Edinburgh
        description: "Design innovative furniture solutions. Salary: £40,000/year. Term: Permanent."
    ),
    Job(title: "Lifestyle Product Photographer",
        logoURL: URL(string: "https://images.squarespace-cdn.com/content/v1/6061a9e58cb0096fe72c1c01/b75a1f7c-8d73-4e8a-a74e-c4f5e3df10a1/E-B-Meyrowitz-Massey-Style.png")!,
        location: CLLocationCoordinate2D(latitude: 51.0074, longitude: -0.2278), // London
        description: "Skilled photographer to join our team in London."
    ),
    Job(title: "Audio Producer",
        logoURL: URL(string: "https://www.bitcni.org.uk/wp-content/uploads/2018/09/BBC-logo.png")!,
        location: CLLocationCoordinate2D(latitude: 53.7808, longitude: -2.1426), // Manchester
        description: "As an audio producer you will be managing the production of a whide variety of sound projects."
   ),
    Job(title: "Brand Specialist",
        logoURL: URL(string: "https://res.cloudinary.com/zenbusiness/image/upload/v1670445040/logaster/logaster-2020-03-amazon-gif-logo.gif")!,
        location: CLLocationCoordinate2D(latitude: 52.192988, longitude: 0.131108), //Cambridge
        description: "You will be responsible for identifying new business opportunities.")
]

