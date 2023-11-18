//
//  UserService.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService: ObservableObject {
    @Published var currentUser: User?
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUId = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users.filter({ $0.id != currentUId })
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(with imageURL: String) async throws {
        guard let currentUId = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUId).updateData([
            "profileImageURL": imageURL
        ])
        
        self.currentUser?.profileImageURL = imageURL
    }
}

extension UserService {
    static let shared = UserService()
}
