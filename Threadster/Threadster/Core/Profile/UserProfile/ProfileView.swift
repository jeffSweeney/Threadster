//
//  ProfileView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                    .padding(.horizontal)
                
                Button {
                    print("TAPPED Follow")
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                // MARK: - User Content List View
                UserContentListView()
                    .padding(.vertical)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
