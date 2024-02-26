import SwiftUI

struct Course: Identifiable {
    let id: Int
    let name: String
    let price: Double
}

struct CourseEnrollment: Identifiable {
    let id = UUID()
    let course: Course
    var price: Double {
        return course.price
    }
}

struct PurchaseCourseView: View {
    @State var cart: [CourseEnrollment] = []
    var courses: [Course] = [
        Course(id: 0, name: "Strategic Marketing", price: 99),
        Course(id: 1, name: "Adobe Creative Basics", price: 199),
        Course(id: 2, name: "Trend Forecasting", price: 149),
        Course(id: 3, name: "Brand Identity", price: 129),
        Course(id: 4, name: "Basic Coding with Python", price: 150)
    ]

    var body: some View {
            VStack {
                // Title for the page
                Text("Courses")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                ZStack {
                    List(courses) { course in
                        NavigationLink(destination: CourseSelectionView(course: course, cart: $cart)) {
                            Text(course.name)
                        }
                    }

                    VStack {
                        Spacer()
                        NavigationLink(destination: CartView(cart: $cart)) {
                            HStack {
                                Image(systemName: "cart.fill")
                                Text("Cart (\(cart.count))")
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

struct CourseSelectionView: View {
    let course: Course
    @Binding var cart: [CourseEnrollment]
    @State private var animateCartButton = false

    var body: some View {
        VStack(spacing: 30) {
            Text(course.name)
                .font(.largeTitle)
                .padding(.top)

            Button("Enroll for $\(course.price, specifier: "%.2f")") {
                let newEnrollment = CourseEnrollment(course: course)
                cart.append(newEnrollment)
                animateCartButton = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    animateCartButton = false
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Spacer()

            NavigationLink(destination: CartView(cart: $cart)) {
                HStack {
                    Image(systemName: "cart.fill")
                    Text("Cart (\(cart.count))")
                }
                .scaleEffect(animateCartButton ? 1.4 : 1.0)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .animation(.easeIn(duration: 0.2))
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
    }
}



struct CartView: View {
    @Binding var cart: [CourseEnrollment]

    var totalCost: Double {
        cart.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        VStack(spacing: 20) {
            List(cart) { enrollment in
                HStack {
                    VStack(alignment: .leading) {
                        Text(enrollment.course.name).font(.headline)
                    }
                    Spacer()
                    Text("$\(String(format: "%.2f", enrollment.price))")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }

            VStack {
                Text("Total: $\(String(format: "%.2f", totalCost))").font(.headline)
                Button("Checkout") {
                    // TODO: implement checkout
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
        .navigationBarTitle("Cart")
        .padding()
    }
}

struct PurchaseCourseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PurchaseCourseView()
        }
    }
}
