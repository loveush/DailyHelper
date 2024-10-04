//
//  ContentView.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 21.09.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
//        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
//            // signed in
//            TrainingsView()
//        } else {
//            FirstOnboardView()
//        }
        FirstOnboardView()
    }
}

#Preview {
    MainView()
}
