//
//  RegistrationView.swift
//  FirebaseLogin
//
//  Created by Kamran Namazov on 03.05.23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        VStack {
            Image("firebase")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .padding(.vertical,32)
            
            VStack(spacing:24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your full name")
                .textInputAutocapitalization(.words)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password", isSecuredField: true)
                
                InputView(text: $confirmpassword, title: "Confirm your password", placeholder: "Enter your password",isSecuredField: true)
                
                //Sign up Button
                Button {
                    Task {
                        try await viewModel.createUser (withEmail: email,password: password,fullname: fullname)
                    }
                } label: {
                    HStack(spacing: 20) {
                        Text("Sign up")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
               
                .padding(.top, 24)
                
            }
            
            
            .padding(.horizontal)
            .padding(.top,12)
            Spacer()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 5) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
