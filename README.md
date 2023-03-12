# SafariCover
SafariCover is a Swift package that provides an easy-to-use interface for displaying web content within your iOS app using the Safari View Controller. This package allows developers to quickly and easily add in-app browsing functionality to their apps, without having to deal with complex webview implementations

### Features:
- Supports iOS 13.0 and later
- Offers a view modifier that enables full-screen Safari browsing with a single line of code
- Handles common Safari View Controller features, such as navigation buttons and status bar styling, automatically
- Compatible with multiple URL schemes, including HTTP, HTTPS, and custom app-specific schemes
- Provides error handling for easy troubleshooting

### Benefits:
- Saves time and effort by simplifying the process of adding in-app browsing functionality to your app
- Offers a consistent and user-friendly browsing experience for your app users
- Minimizes the risk of errors and crashes by providing a robust and tested solution for displaying web content within your app
- Offers peace of mind with error handling for easy debugging and maintenance

## Installation
Ready to use on iOS 13.0 and later. Supports iOS, iPadOS and macOS

### Swift Package Manager

In Xcode go to `File` -> `Add Packages...` and insert url: 

```
https://github.com/TopScrech/SafariCover
```

or adding it to the `dependencies` value of your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/TopScrech/SafariCover", .upToNextMajor(from: "1.0.0"))
]
```

## Usage
Make sure to import SafariCover library
```
import SafariCover
```

then add this view modifier to any view and don't forget to create a @State or @Published property
```
.safariCover($isPresented, url: "https://github.com/TopScrech")
```

### Get started with SafariCover today and enhance your app's browsing capabilities with ease!