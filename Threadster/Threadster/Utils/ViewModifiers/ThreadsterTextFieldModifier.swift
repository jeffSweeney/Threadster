//
//  ThreadsterTextFieldModifier.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/4/23.
//

import SwiftUI

struct ThreadsterTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
