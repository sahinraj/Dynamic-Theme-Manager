
//
//  DynamicThemeManager.swift
//  Dynamic Theme Manager
//
//  Created by sahin raj on 12/6/24.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case light, dark, custom
    
    var id: String { self.rawValue }
    
    var name: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        case .custom: return "Custom"
        }
    }
}

struct ThemeColors: Equatable {
    var background: Color
    var foreground: Color
}

class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") private var selectedTheme: Theme = .light
    
    @Published var currentTheme: ThemeColors = ThemeColors(background: .white, foreground: .black)
    
    init() {
        applyTheme(theme: selectedTheme)
    }
    
    func applyTheme(theme: Theme) {
        switch theme {
        case .light:
            currentTheme = ThemeColors(background: .white, foreground: .black)
        case .dark:
            currentTheme = ThemeColors(background: .black, foreground: .white)
        case .custom:
            currentTheme = ThemeColors(background: .purple, foreground: .orange) // Example custom theme
        }
        selectedTheme = theme
    }
}

extension View {
    func theme(_ themeManager: ThemeManager) -> some View {
        self.background(themeManager.currentTheme.background)
            .foregroundColor(themeManager.currentTheme.foreground)
    }
}
