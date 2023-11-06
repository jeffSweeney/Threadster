//
//  ThreadCell.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularImageProfileView(assetName: "lewis-hamilton")
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("LewisHamilton1")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            print("Tapped ellipsis")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }

                    }
                    
                    Text("Formula 1 champion")
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
        ThreadCell()
    }
}
