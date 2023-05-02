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
struct SafariButton<Content: View>: View {
    @Binding var showSafari: Bool
    let url: String
    let label: Content
    
    init(showSafari: Binding<Bool>, url: String, @ViewBuilder label: () -> Content) {
        self._showSafari = showSafari
        self.url = url
        self.label = label()
    }
    
    var body: some View {
        Menu {
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
        } label: {
            label
        }
        .safariCover($showSafari, url: url)
    }
}
#endif
