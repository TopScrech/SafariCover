# SafariCover
SwiftUI library for opening in-app Safari

## Supported platforms
- iOS / iPadOS 14+
- macOS 11+

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

Apply the `.safariCover()` view modifier to any view, using a @State or @Published property to manage its presentation:
```swift
import SafariCover

struct ContentView: View {
    @State private var isPresented = false

    private let urlString = "https://github.com/TopScrech"
    private let url = URL(string: "https://github.com/TopScrech")!
    
    var body: some View {
        Button("Open Safari") {
            isPresented = true
        }
        .safariCover($isPresented, url: urlString)
        
        // You can also pass a URL object
        
        .safariCover($isPresented, url: url)
    }
}
```
