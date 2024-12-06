---

# Dynamic Theme Manager for SwiftUI

A **Dynamic Theme Manager** built with SwiftUI to demonstrate dynamic theming, persistent user preferences, and a clean, reusable architecture. This project is designed for iOS developers to showcase skills in state management, theming, and SwiftUI.

## Features

- 🌞 **Light, Dark, and Custom Themes**: Switch between predefined themes with ease.
- 🖌️ **Real-Time Updates**: Theme changes apply dynamically across the app, including the navigation bar.
- 💾 **Persistent Preferences**: Uses `@AppStorage` to save user preferences across app launches.
- 📱 **Reusable Architecture**: Easily integrate the theme manager into other SwiftUI projects.
- 🎨 **Navigation Bar Customization**: Dynamically updates the `UINavigationBar` appearance.

---

## Screenshots

| Light Theme | Dark Theme | Custom Theme |
|-------------|------------|--------------|
| ![Light Theme](assets/light_theme.png) | ![Dark Theme](assets/dark_theme.png) | ![Custom Theme](assets/custom_theme.png) |

---

## How It Works

1. **ThemeManager**:
   - Centralized class for managing theme states.
   - Provides `ThemeColors` for the current theme (background and foreground colors).
   - Observed across the app using `@EnvironmentObject`.

2. **Dynamic Updates**:
   - `onChange` modifier detects changes to the theme and reconfigures the navigation bar appearance dynamically.

3. **Persistent Storage**:
   - Uses `@AppStorage` to save the selected theme and reload it during app launch.

4. **Reusable View Extensions**:
   - Easily apply theme-specific styles using `theme(_:)` view modifiers.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/sahinraj/Dynamic-Theme-Manager.git
   cd dynamic-theme-manager
   ```

2. Open the Xcode project:
   ```bash
   open DynamicThemeManager.xcodeproj
   ```

3. Build and run the app in the simulator or on a device.

---

## Usage

### Select a Theme
1. Navigate to the **Theme Selector** page.
2. Tap on any theme to apply it dynamically.

### Preview the Theme
1. Go to the **Theme Preview** page to see the theme in action.

---

## Code Overview

### ThemeManager

A centralized class for theme management:

```swift
class ThemeManager: ObservableObject {
    @Published var currentTheme: ThemeColors = ThemeColors(background: .white, foreground: .black)

    func applyTheme(theme: Theme) {
        // Update the current theme
    }
}
```

### Navigation Bar Updates

Dynamically updates `UINavigationBarAppearance` when the theme changes:

```swift
private func configureNavigationBarAppearance(for theme: ThemeColors) {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = UIColor(theme.background)
    appearance.titleTextAttributes = [.foregroundColor: UIColor(theme.foreground)]
    UINavigationBar.appearance().standardAppearance = appearance
}
```

### ThemeColors

A simple struct representing the background and foreground colors:

```swift
struct ThemeColors: Equatable {
    var background: Color
    var foreground: Color
}
```

---

## Project Structure

```
DynamicThemeManager/
├── ThemeManager.swift        # Manages theme state and updates
├── ContentView.swift         # Main view with navigation links
├── ThemeSelectorView.swift   # Theme selection page
├── ThemePreviewView.swift    # Theme preview page
├── Assets.xcassets           # Theme-related assets
├── README.md                 # Project documentation
```

---

## Requirements

- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

---

## License

This project is open-source and available under the [MIT License](LICENSE).

---

## Author

**Sahin Raj**  
- [GitHub](https://github.com/sahinraj)  
- [LinkedIn](https://www.linkedin.com/in/sahinraj/)  

---