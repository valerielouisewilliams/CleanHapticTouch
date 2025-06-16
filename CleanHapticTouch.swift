//
//  CleanHapticTouch.swift
//  hapticstest
//
//  Created by Valerie Williams on 6/16/25.
//

import Foundation


enum HapticType {
    case tap(HapticStyle)
    case longPress(duration: Double, feedback: HapticStyle)
    
    enum HapticStyle {
        case light, medium, heavy, start, warning
        
        var feedback: SensoryFeedback {
            switch self {
            case .light: return .impact(weight: .light)
            case .medium: return .impact(weight: .medium)
            case .heavy: return .impact(weight: .heavy)
            case .start: return .start
            case .warning: return .warning
            }
        }
    }
}
