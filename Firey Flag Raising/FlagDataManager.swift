//
//  FlagDataManager.swift
//  Firey Flag Raising
//
//  Created by YJ Soon on 7/9/21.
//

import FirebaseDatabase
import FirebaseDatabaseSwift
import Foundation
import SwiftUI

class FlagDataManager: ObservableObject {
    
    @Published var flag = Flag(emoji: "🇸🇬", description: "Singapore")
    @Published var flagOffset = 20.0
    
    let ref = Database.database().reference()
    
    func saveFlag() {
        try? ref.child("flag").setValue(from: flag)
    }
    
    func saveFlagOffset() {
        try? ref.child("offset").setValue(from: flagOffset)
    }

}
