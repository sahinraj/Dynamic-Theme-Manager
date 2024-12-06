//
//  ContentView.swift
//  Dynamic Theme Manager
//
//  Created by sahin raj on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                themeManager.currentTheme.background // Apply background to entire screen
                
                VStack(spacing: 20) {
                    NavigationLink(destination: ThemeSelectorView()
                        .environmentObject(themeManager)) {
                        Text("Go to Theme Selector")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeManager.currentTheme.foreground.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ThemePreviewView()
                        .environmentObject(themeManager)) {
                        Text("Go to Theme Preview")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeManager.currentTheme.foreground.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Dynamic Theme Manager")
            .foregroundColor(themeManager.currentTheme.foreground)
            .onAppear {
                configureNavigationBarAppearance(for: themeManager.currentTheme)
            }
            .onChange(of: themeManager.currentTheme) { newTheme in
                configureNavigationBarAppearance(for: newTheme)
            }
        }
        .environmentObject(themeManager)
    }
    
    private func configureNavigationBarAppearance(for theme: ThemeColors) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(theme.background)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(theme.foreground)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(theme.foreground)]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}

