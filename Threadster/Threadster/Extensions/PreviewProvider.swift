//
//  PreviewProvider.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/12/23.
//

import Firebase
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Jeff R Sweeney", email: "jeff@test.com", username: "jeff_123")
    
    let thread = Thread(ownerId: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 42)
}
