import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var isLoggedIn = false
    @State private var showWelcome = false
    @State private var showWanderingCreatives = false
    @State private var showLoginButton = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                AsyncImage(url: URL(string: "https://img.freepik.com/premium-vector/nature-mountain-wild-line-illustration_24519-853.jpg?w=1060")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 350)
                .padding()
                
                // First part of the welcome message
                if showWelcome {
                    Text("Welcome to...")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.accent))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .transition(.opacity)
                }
                
                // Second part of the welcome message
                if showWanderingCreatives {
                    Text("Wandering Creatives.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.accent))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .transition(.opacity)
                }

                // Login button
                if showLoginButton {
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $isLoggedIn,
                        label: {
                            LoginButton()
                                .frame(width: 280, height: 45)
                                .cornerRadius(8)
                                .padding()
                        }
                    )
                    .navigationBarBackButtonHidden(true)
                    .navigationTitle("")
                    .transition(.opacity)
                }

                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    showWelcome = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showWanderingCreatives = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showLoginButton = true
                }
            }
        }
    }
}

struct LoginButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        // No need to update anything
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
