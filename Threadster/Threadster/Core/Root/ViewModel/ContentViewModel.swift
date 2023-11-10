//
//  ContentViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/10/23.
//

import Combine
import Firebase
import Foundation

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
