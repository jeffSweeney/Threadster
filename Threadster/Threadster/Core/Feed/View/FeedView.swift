//
//  FeedView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Hello, Feed!")
                .font(.title)
                .fontWeight(.bold)
                .underline()
            
            HStack(spacing: 16) {
                Image(systemName: "cloud.bolt.rain")
                Text("PAGE UNDER CONSTRUCTION")
                Image(systemName: "cloud.bolt.rain")
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
