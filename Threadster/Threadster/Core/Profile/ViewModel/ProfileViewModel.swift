//
//  ProfileViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/10/23.
//

import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine is \(user)")
        }
        .store(in: &cancellables)
    }
}
