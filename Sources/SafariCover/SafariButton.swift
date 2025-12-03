#if os(iOS) || os(visionOS)

import SwiftUI

@MainActor
@available(iOS 10, *)
public func openSafari(_ url: String, completion: @escaping () -> Void = {}) {
    if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:]) { _ in
            completion()
        }
    }
}

@MainActor
@available(iOS 10, *)
public func openSafari(_ url: URL?, completion: @escaping () -> Void = {}) {
    if let url, UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:]) { _ in
            completion()
        }
    }
}

@available(iOS 14, macOS 11, tvOS 14, watchOS 7, *)
public struct SafariMenu <Content: View>: View {
    let url: String
    let label: Content
    
    public init(
        _ url: String,
        @ViewBuilder label: () -> Content
    ) {
        self.url = url
        self.label = label()
    }
    
    @State private var showSafari = false
    
    public var body: some View {
        Menu {
            Button("In-app Safari", systemImage: "safari") {
                showSafari = true
            }
            
            Button("Safari", systemImage: "safari.fill") {
                openSafari(url)
            }
        } label: {
            label
        }
        .safariCover($showSafari, url: url)
    }
}

@available(iOS 14, macOS 11, tvOS 14, watchOS 7, *)
public struct SafariButton <Content: View>: View {
    let url: String
    let label: Content
    
    public init(
        _ url: String,
        @ViewBuilder label: () -> Content
    ) {
        self.url = url
        self.label = label()
    }
    
    @State private var showSafari = false
    
    public var body: some View {
        Button {
            showSafari = true
        } label: {
            label
        }
        .safariCover($showSafari, url: url)
    }
}

#Preview {
    if #available(iOS 14, macOS 11, tvOS 14, watchOS 7, *) {
        SafariButton("") {
            Text("Preview")
        }
    }
}

#endif
