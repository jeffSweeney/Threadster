//
//  ThreadReplyView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/27/23.
//

import SwiftUI

struct ThreadReplyView: View {
    let thread: Thread
    @State private var replyText = ""
    @State private var threadViewHeight: CGFloat = 24
    
    @Environment(\.dismiss) var dismiss
    
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        VStack {
                            CircularImageProfileView(user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .top) {
                        CircularImageProfileView(user: currentUser, size: .small)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                    }
                }
                .padding()
                
                Spacer()
            }
            .onAppear { setThreadViewHeight() }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        dismiss()
                    }
                    .opacity(replyText.isEmpty ? 0.25 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

extension ThreadReplyView {
    private func setThreadViewHeight() {
        let imageDimension: CGFloat = ProfileImageSize.small.dimension
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        
        let captionSize = thread.caption.heightWithConstrainedWidth(width, font: font)
        threadViewHeight = captionSize + imageDimension - 16
    }
}

#Preview {
    ThreadReplyView(thread: DeveloperPreview.shared.thread)
}
