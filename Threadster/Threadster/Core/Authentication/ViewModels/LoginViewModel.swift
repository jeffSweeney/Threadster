//
//  LoginViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/10/23.
//

import Firebase
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
