//
//  CurrentUserProfileViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/10/23.
//

import Combine
import Foundation

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
}
