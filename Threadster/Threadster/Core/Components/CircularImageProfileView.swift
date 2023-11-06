//
//  CircularImageProfileView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/6/23.
//

import SwiftUI

struct CircularImageProfileView: View {
    let assetName: String
    
    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

struct CircularImageProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageProfileView(assetName: "Balloons")
    }
}
