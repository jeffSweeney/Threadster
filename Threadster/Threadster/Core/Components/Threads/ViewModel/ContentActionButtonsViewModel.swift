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
    
    func likeThread() {
        self.thread.didLike = true
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
