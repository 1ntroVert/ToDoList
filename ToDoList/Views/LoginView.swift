//
//  LoginView.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    angle: 15,
                    background: Color.pink
                )
                FormView()
                Spacer()
            }
        }
    }
}

private struct FormView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        Form {
            TextField("Email address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            CustomButton(
                text: "Log In",
                background: Color.blue
            ) {
                
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
