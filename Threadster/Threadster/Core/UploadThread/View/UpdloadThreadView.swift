//
//  UpdloadThreadView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct UpdloadThreadView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Hello, Upload Thread!")
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

struct UpdloadThreadView_Previews: PreviewProvider {
    static var previews: some View {
        UpdloadThreadView()
    }
}
