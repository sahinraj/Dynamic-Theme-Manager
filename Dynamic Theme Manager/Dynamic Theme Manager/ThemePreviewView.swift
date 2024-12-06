//
//  ThemePreviewView.swift
//  Dynamic Theme Manager
//
//  Created by sahin raj on 12/6/24.
//

import SwiftUI

struct ThemePreviewView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ZStack {
            themeManager.currentTheme.background // Apply background
            
            VStack(spacing: 20) {
                Text("Theme Preview")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(themeManager.currentTheme.foreground)
                
                Text("This is how the theme looks in action!")
                    .font(.body)
                    .foregroundColor(themeManager.currentTheme.foreground)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Theme Preview")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.bottom) // Ensure content does not go above navigation bar
    }
}
