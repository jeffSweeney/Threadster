//
//  Thread.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/19/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Codable, Identifiable {
    @DocumentID var threadId: String?
    let ownerId: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
    
    // Related to current client side user - not uploading to DB
    var didLike: Bool? = false
}
