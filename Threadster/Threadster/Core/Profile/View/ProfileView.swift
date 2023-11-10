//
//  ProfileView.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/5/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        // MARK: - Bio & Stats
                        // Leveraging nested VStacks for custom spacing
                        VStack(alignment: .leading, spacing: 12) {
                            // MARK: - Name & Username
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Jeff Sweeney")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("jeff_sweeney_1")
                            }
                            
                            Text("iOS Developer - SunDazeApps")
                                .font(.footnote)
                            
                            Text("42 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        CircularImageProfileView(assetName: "CampFire")
                    }
                    
                    Button {
                        print("TAPPED Follow")
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }

                    // MARK: - User Content List View
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)

                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        
                        if selectedFilter == .threads {
                            LazyVStack {
                                ForEach(0 ... 10, id: \.self) { thread in
                                    ThreadCell()
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color(.black))
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
