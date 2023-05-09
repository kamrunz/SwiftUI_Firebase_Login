//
//  ProfileView.swift
//  FirebaseLogin
//
//  Created by Kamran Namazov on 04.05.23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section() {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72,height: 72)
                            .background(Color(.systemGray3))
                        .clipShape(Circle())
                        VStack(alignment: .leading,spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            
                        }
                    }
                    
                }
                Section("General") {
                    HStack {
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                }
                Section("Account") {
                    Button {
                        print("Sign out")
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                    }
                    Button {
                        print("Sign out")
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
