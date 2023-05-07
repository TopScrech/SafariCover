#if os(iOS)
import SwiftUI
import UIKit

@available(iOS 10, *)
public func openSafari(_ url: String, completion: @escaping () -> Void = {}) {
    if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:]) {_ in
            completion()
        }
    }
}

@available(iOS 14, macOS 11, tvOS 14, watchOS 7, *)
public struct SafariButton<Content: View>: View {
    let url: String
    let label: Content
    let content: () -> Content
    
    public init(
        _ url: String,
        @ViewBuilder label: () -> Content,
        @ViewBuilder content: @escaping () -> Content = { EmptyView() as! Content }
    ) {
        self.url = url
        self.label = label()
        self.content = content
    }
    
    @State private var showSafari = false
    
    public var body: some View {
        Menu {
            Section {
                Button {
                    showSafari = true
                } label: {
                    Label("In-app Safari", systemImage: "safari")
                }
                
                Button {
                    openSafari(url)
                } label: {
                    Label("Safari", systemImage: "safari.fill")
                }
            }
            
            content()
        } label: {
            label
        }
        .safariCover($showSafari, url: url)
    }
}
#endif
