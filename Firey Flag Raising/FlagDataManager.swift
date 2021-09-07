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
    
    func setupDataObserver() {
        ref.observe(.value) { snapshot in
            let flagSnapshot = snapshot.childSnapshot(forPath: "flag")
            if let flag = try? flagSnapshot.data(as: Flag.self) {
                self.flag = flag
            }
            
            let flagOffsetSnapshot = snapshot.childSnapshot(forPath: "offset")
            if let flagOffset = try? flagOffsetSnapshot.data(as: Double.self) {
                self.flagOffset = flagOffset
            }

        }
    }

}
