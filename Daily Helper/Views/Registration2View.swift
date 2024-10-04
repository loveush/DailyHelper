//
//  Registration2View.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 22.09.2024.
//

import SwiftUI

struct Registration2View: View {
    @State var weight:String = ""
    @State var height = ""
    @State var name = ""
    
    @ObservedObject var viewModel: SecondRegistrationViewViewModel
    
    var body: some View {
        ZStack {
            LoginBackgroundView()
                .frame(width: UIScreen.main.bounds.width)
            
            VStack {
                Spacer(minLength: 150)
                
                Text("Ваши данные")
                    .font(.title)
                    .foregroundColor(Color("text"))
                
                Spacer()
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Как вас зовут?")
                            .foregroundColor(Color("text"))
                        Spacer()
                    }
                    .offset(x:40)
                    CustomTextField(text: $name, placeholder: "Введите имя..")
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    
                    HStack {
                        Text("Ваш рост")
                            .foregroundColor(Color("text"))
                        Spacer()
                    }
                    .offset(x:40)
                    CustomTextField(text: $height, placeholder: "Введите рост...")
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    
                    HStack {
                        Text("Ваш вес")
                            .foregroundColor(Color("text"))
                        Spacer()
                    }
                    .offset(x:40)
                    CustomTextField(text: $weight, placeholder: "Введите вес...")
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                }
                
                Spacer(minLength: 120)
                
                TLButton(title: "Завершить", background: Color("darkpink")) {
                    if let heightValue = Double(height),
                       let weightValue = Double(weight) {
                        viewModel.completeRegistration(name: name,
                                                       height: heightValue,
                                                       weight: weightValue)
                    }  else {
                        viewModel.errorMessage = "Incorrect input"
                    }
                }
                .frame(width: 180, height: 55)
                
                Spacer()
                        
            }
        }
    }
}

#Preview {
    Registration2View(viewModel: SecondRegistrationViewViewModel(user: User(id: "", email: "", password: "", name: "", height: 0.0, weight: 0.0, joined: 0)))
}
