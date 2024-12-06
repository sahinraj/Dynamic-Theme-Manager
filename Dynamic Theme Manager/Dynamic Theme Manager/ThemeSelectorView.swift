//
//  ThemeSelectorView.swift
//  Dynamic Theme Manager
//
//  Created by sahin raj on 12/6/24.
//

import SwiftUI

struct ThemeSelectorView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ZStack {
            themeManager.currentTheme.background // Apply background
            
            VStack(spacing: 20) {
                Text("Select a Theme")
                    .font(.title)
                    .bold()
                    .foregroundColor(themeManager.currentTheme.foreground)
                
                ForEach(Theme.allCases) { theme in
                    Button(action: {
                        themeManager.applyTheme(theme: theme)
                    }) {
                        Text(theme.name)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(themeManager.currentTheme.foreground.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(themeManager.currentTheme.foreground)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Theme Selector")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.bottom) // Ensure the content stays below the navigation bar
    }
}
