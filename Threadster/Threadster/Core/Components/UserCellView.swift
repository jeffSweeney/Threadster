//
//  UserCellView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/6/23.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack {
            CircularImageProfileView(assetName: "Balloons")
            
            VStack(alignment: .leading) {
                Text("Balloon Man")
                    .fontWeight(.semibold)
                
                Text("John B Doe")
            }
            .font(.footnote)
            
            Spacer()
            
            Button {
                print("TAPPED Follow")
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }

        }
        .padding(.horizontal)
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}
