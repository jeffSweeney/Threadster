//
//  ImageUploader.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/18/23.
//

import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        
        let filename = NSUUID().uuidString
        let storageReference = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await storageReference.putDataAsync(imageData)
            let url = try await storageReference.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
