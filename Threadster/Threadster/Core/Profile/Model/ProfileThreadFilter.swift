//
//  ProfileThreadFilter.swift
//  Threadster
//
//  Created by Jeffrey Sweeney on 11/6/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
            case .threads: return "Threads"
            case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
