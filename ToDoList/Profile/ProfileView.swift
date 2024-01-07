//
//  ProfileView.swift
//  ToDoList
//
//  Created by a.shlauzer on 05.01.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                profile(user: user)
            } else {
                Text("Loading profile...")
            }
        }
        .navigationTitle("Profile")
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 125, height: 125)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                
                HStack {
                    Text("Member since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding()
            }
            .padding()
            
            Button("Log out") {
                viewModel.logOut()
            }
            .tint(.red)
            .padding()
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
