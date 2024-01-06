//
//  RegisterView.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        HeaderView(
            title: "Register",
            subtitle: "Start organizing todos",
            angle: -15,
            background: Color.orange
        )
        
        form
        
        Spacer()
    }
    
    @ViewBuilder
    var form: some View {
        Form {
            TextField("Full name", text: $viewModel.fullName)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            CustomButton(
                text: "Create account",
                background: .green
            ) {
                viewModel.register()
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
