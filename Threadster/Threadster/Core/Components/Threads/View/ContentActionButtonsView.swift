//
//  ContentActionButtonsView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/25/23.
//

import SwiftUI

struct ContentActionButtonsView: View {
    @ObservedObject var viewModel: ContentActionButtonsViewModel
    
    init(thread: Thread) {
        viewModel = ContentActionButtonsViewModel(thread: thread)
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false // Property given default - should never be nil
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Button {
                didLike ? viewModel.unlikeThread() : viewModel.likeThread()
            } label: {
                Image(systemName: self.didLike ? "heart.fill" : "heart")
                    .foregroundStyle(self.didLike ? Color(.red) : Color(.black))
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
    }
}

#Preview {
    ContentActionButtonsView(thread: DeveloperPreview.shared.thread)
}
