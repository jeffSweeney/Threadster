//
//  ActivityView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Hello, Activity!")
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

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
