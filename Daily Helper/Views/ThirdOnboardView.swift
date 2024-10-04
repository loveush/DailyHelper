//
//  ThirdOnboardView.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 28.09.2024.
//

import SwiftUI

struct ThirdOnboardView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                OnboardBackground()
                    .frame(width: UIScreen.main.bounds.width)
                VStack {
                    Spacer(minLength: 140)
                    Image("schedule")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(2.5, contentMode: .fit)
                        .offset(x:80, y: 40)
                    Spacer()
                    VStack (spacing: 12) {
                        Text("Составляйте график\nтренировок")
                            .foregroundColor(Color("text"))
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24))
                            .padding(.horizontal, 22)
                        Text("Мы поможем вам отслеживать личный прогресс")
                            .font(.system(size: 16))
                            .padding(.horizontal, 40)
                    }
                    .foregroundColor(Color("text"))
                    .multilineTextAlignment(.center)
                    Spacer()
                    
                    VStack (spacing: 15){
                        CustomNavigationLink(destination: RegistrationView(),
                                             title: "Зарегистрироваться")
                        .frame(width: 230, height: 55)
                        NavigationLink(destination: LoginView()) {
                            Text("У меня уже есть аккаунт")
                                .foregroundStyle(.white)
                        }
                    }
                        
                    Spacer(minLength: 60)
                }
            }
        }
    }
}

#Preview {
    ThirdOnboardView()
}
