//
//  ContentActionButtonsViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/25/23.
//

import Foundation

class ContentActionButtonsViewModel: ObservableObject {
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    @MainActor
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
