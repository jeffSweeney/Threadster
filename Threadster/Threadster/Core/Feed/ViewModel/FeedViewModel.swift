//
//  FeedViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/19/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var threads: [Thread] = []
    
    init() {
        Task { try await fetchThreads() }
    }
    
    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    @MainActor
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let ownerId = threads[i].ownerId
            let threadUser = try await UserService.fetchUser(withUid: ownerId)
            self.threads[i].user = threadUser
        }
    }
}
