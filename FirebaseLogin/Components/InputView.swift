//
//  InputView.swift
//  FirebaseLogin
//
//  Created by Kamran Namazov on 03.05.23.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            Text(title)
                .foregroundColor(Color.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecuredField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "E-mail address", placeholder: "name@example.com")
    }
}
