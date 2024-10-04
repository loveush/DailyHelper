import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            if #available(iOS 18.0, *) {
                TabView {
                    Tab("WaterBalance", systemImage: "drop") {
                        WaterBalanceView()
                    }
                    
                    Tab("Pillbox", systemImage: "pills") {
                        PillboxView()
                    }
                    
                    Tab("Workouts", systemImage: "figure.strengthtraining.functional") {
                        WorkoutsView()
                    }
                    
                    Tab("Profile", systemImage: "person") {
                        ProfileView()
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        } else {
            FirstOnboardView()
        }
    }
}

#Preview {
    MainView()
}
