//
//  ProfileHeaderView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/17/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            // MARK: - Bio & Stats
            // Leveraging nested VStacks for custom spacing
            VStack(alignment: .leading, spacing: 12) {
                // MARK: - Name & Username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("42 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularImageProfileView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
