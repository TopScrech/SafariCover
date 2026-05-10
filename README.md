# SafariCover
SwiftUI library for opening in-app Safari

## Supported platforms
- iOS/iPadOS 14+
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
