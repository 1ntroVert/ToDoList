//
//  RegisterView.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        HeaderView(
            title: "Register",
            subtitle: "Start organizing todos",
            angle: -15,
            background: Color.orange
        )
        FormView()
        Spacer()
    }
}

private struct FormView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""

    var body: some View {
        Form {
            TextField("Full name", text: $fullName)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            CustomButton(
                text: "Create account",
                background: .green
            ) {
                
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
