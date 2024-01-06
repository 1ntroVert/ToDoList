//
//  LoginView.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    angle: 15,
                    background: Color.pink
                )
                
                form
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    var form: some View {
        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage).foregroundColor(.red)
            }
            TextField("Email address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            CustomButton(
                text: "Log In",
                background: Color.blue
            ) {
                viewModel.login()
            }
            .padding()
        }
        .offset(y: -50)
        
        VStack {
            Text("New around here?")
            NavigationLink("Create an account", destination: RegisterView())
        }
        .padding(.bottom, 50)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
