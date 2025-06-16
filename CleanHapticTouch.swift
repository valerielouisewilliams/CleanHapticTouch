//
//  CleanHapticTouch.swift
//  CleanHapticTouch
//
//  Created by Valerie Williams on 6/16/25.
//

import Foundation
import SwiftUI

/**
 This code is meant to clean up the way that you apply different types of haptics
 to the same view based on a user's gesture. This code currently only supports taps
 and long presses, but I will update it to add other types soon.
 */

/**
 Defines the HapticStyle in enumeration style for clean chaining.
 Encapsulates gesture types along with the haptic feedback style
 that you want to apply to a certain type of gesture.
 */
enum HapticType {
    case tap(HapticStyle)
    case longPress(duration: Double, feedback: HapticStyle)
    
    enum HapticStyle {
        case light, medium, heavy, start, warning, error
        
        var feedback: SensoryFeedback {
            switch self {
            case .light: return .impact(weight: .light)
            case .medium: return .impact(weight: .medium)
            case .heavy: return .impact(weight: .heavy)
            case .start: return .start
            case .warning: return .warning
            case .error: return .error
            }
        }
    }
}

/**
 Reusable view modifier that combines gesture, haptic, and hapticsEnabled.
 */
struct GestureHapticModifier: ViewModifier {
    let type: HapticType
    @State private var trigger = UUID()
    
    func body(content: Content) -> some View {
                
        switch type {
        case .tap(let style):
            return AnyView (
                content.simultaneousGesture(
                    TapGesture() // Normal tap
                        .onEnded {
                            trigger = UUID()
                        }
                )
            .sensoryFeedback(style.feedback, trigger: trigger)
            )
            
        case .longPress(duration: let duration, feedback: let style):
            return AnyView(
                content.simultaneousGesture( // Long press
                    LongPressGesture(minimumDuration: duration)
                        .onEnded { _ in
                            trigger = UUID()
                        }
                )
            .sensoryFeedback(style.feedback, trigger: trigger)
            )
        }
    }
    
}
 
/**
 View extension so that we can chain.
 This is the only thing you need to call on the view you're
 trying to applying haptics to.
 */
extension View {
    func haptic(_ type: HapticType) -> some View {
        self.modifier(GestureHapticModifier(type: type))
    }
}
