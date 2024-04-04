//
//  UIConstants.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//

import SwiftUI

@Observable
class UIConstants {
    
    
    static let shared = UIConstants()
    
    var appTint: String = UserDefaults.standard.string(forKey: "appTint") ?? "orange"
    
    var tintColor: Color {
        return tints.first { $0.color == appTint }?.value ?? .blue
    }
}

