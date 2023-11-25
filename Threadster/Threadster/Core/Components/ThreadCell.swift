//
//  ThreadCell.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularImageProfileView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            print("Tapped ellipsis")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }

                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            print("tapped heart")
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            print("tapped bubble.right")
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            print("tapped arrow.rectanglepath")
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            print("tapped paperplane")
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            
            Divider()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
