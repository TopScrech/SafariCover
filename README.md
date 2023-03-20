# SafariCover: Effortless In-App Browsing for SwiftUI Apps
SafariCover is a powerful Swift package designed to simplify the process of integrating web content within your iOS app using the Safari View Controller. With an intuitive interface, this package enables developers to effortlessly add in-app browsing functionality to their apps, without the complexities of webview implementations.

### Features:
- Compatible with iOS 14.0, iPadOS 14.0, macOS 11 and later for seamless integration across platforms
- Single-line view modifier for full-screen Safari browsing within your app
- Automatic handling of common Safari View Controller features, including navigation buttons and status bar styling
- Supports various URL schemes, such as HTTP, HTTPS, and custom app-specific schemes
- Built-in error handling for easy troubleshooting and enhanced stability

### Benefits:
- Streamline your development process by quickly integrating in-app browsing capabilities
- Deliver a consistent and user-friendly browsing experience to your app users
- Reduce the risk of errors and crashes with a robust, tested solution for displaying web content
- Debug and maintain your app with ease using the provided error handling

## Installation
### Swift Package Manager

To integrate SafariCover into your Xcode project, navigate to File -> Add Packages... and enter the following URL:
```
https://github.com/TopScrech/SafariCover
```
Alternatively, include it as a dependency in your Package.swift's dependencies value:
```
dependencies: [
    .package(url: "https://github.com/TopScrech/SafariCover", .branchItem("main"))
]
```

## Usage
First, import the SafariCover library into your project:
```
import SafariCover
```

Next, apply the .safariCover() view modifier to any view, using a @State or @Published property to manage the presentation:
```
View {...}
    .safariCover($isPresented, url: "https://github.com/TopScrech")
```

You can also pass a URL object:
```
let url: URL
View {...}
    .safariCover($isPresented, url: url)
```

### Upgrade your app's browsing capabilities effortlessly with SafariCover today!
