//
//  ExploreView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Hello, Explore!")
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
