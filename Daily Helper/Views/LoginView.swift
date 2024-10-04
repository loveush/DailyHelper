//
//  LoginView.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 21.09.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        ZStack {
            LoginBackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            
            VStack {
                Spacer(minLength: 270)
                
                Text("Вход")
                    .font(.title)
                    .foregroundColor(Color("text"))
                
                VStack(spacing: 15) {
                    CustomTextField(text: $viewModel.email,
                                    placeholder: "Введите логин...")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    CustomSecureField(text: $viewModel.password,
                                      placeholder: "Введите пароль...")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                }
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(Color.red)
                }
                
                Spacer(minLength: 180)
                
                TLButton(title: "Войти",
                         background: Color("darkpink")) {
                    viewModel.login()
                }
                .frame(width: 180, height: 55)
                
                Spacer()
                        
            }
        }
    }
}

#Preview {
    LoginView()
}
