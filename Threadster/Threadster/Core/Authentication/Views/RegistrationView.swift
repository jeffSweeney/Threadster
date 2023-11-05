//
//  RegistrationView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/4/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsterTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsterTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsterTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsterTextFieldModifier())
            }
            
            Button {
                print("Tapped SIGN UP")
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsterButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical, 16)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
