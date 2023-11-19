//
//  UploadThreadViewModel.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/19/23.
//

import Firebase

class UploadThreadViewModel: ObservableObject {
    @Published var caption = ""
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownderUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
