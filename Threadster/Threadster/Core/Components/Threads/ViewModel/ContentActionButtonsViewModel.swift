//
//  ContentActionButtonsViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/25/23.
//

import Foundation

@MainActor
class ContentActionButtonsViewModel: ObservableObject {
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfUserLikedThread() }
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikedThread(thread)
        
        // We default to false - only execute an update if user did like the thread
        if didLike {
            self.thread.didLike = true
        }
    }
}
