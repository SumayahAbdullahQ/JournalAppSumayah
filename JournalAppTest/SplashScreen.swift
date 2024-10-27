//
//  SplashScreen.swift
//  JournalAppTest
//
//  Created by Sumayah Alqahtani on 17/04/1446 AH.
//

import SwiftUI
import Combine

// ViewModel
class SplashScreenViewModel: ObservableObject {
    @Published var isActive = false

    init() {
        // Transition to the main page after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isActive = true
        }
    }
}

// View
struct SplashScreen: View {
    @StateObject private var viewModel = SplashScreenViewModel()
    
    var body: some View {
        Group {
            if viewModel.isActive {
                MainPage()
            } else {
                ZStack {
                    Color.black // Set your desired background color here
                        .ignoresSafeArea() // This makes the color fill the entire screen
                    VStack {
                        Image(.journali)
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Journali")
                            .font(.system(size: 42, weight: .black))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 5)
                        Text("Your thoughts, your story")
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(Color.white)
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
