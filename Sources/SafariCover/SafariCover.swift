#if canImport(SafariServices)

import SwiftUI
import SafariServices

struct UniversalURL {
    var urlRepresentation: URL
    
    static let fallbackURLString = "https://topscrech.dev/invalidurl"
    
    init(_ urlString: String) {
        if let url = URL(string: urlString) {
            urlRepresentation = url
        } else {
            print("Invalid URL string:", urlString)
            urlRepresentation = URL(string: Self.fallbackURLString)!
        }
    }
    
    init(_ url: URL) {
        self.urlRepresentation = url
    }
}

#if !os(macOS)
struct SafariView: UIViewControllerRepresentable {
    let url: UniversalURL
    
    init(_ url: UniversalURL) {
        self.url = url
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url.urlRepresentation)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

@available(iOS 14, *)
struct SafariCover: ViewModifier {
    @Binding var isPresented: Bool
    
    let url: UniversalURL
    
    init(_ isPresented: Binding<Bool>, url: UniversalURL) {
        _isPresented = isPresented
        self.url = url
    }
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                SafariView(url)
                    .ignoresSafeArea()
            }
    }
}

@available(iOS 14, *)
public extension View {
    func safariCover(_ isPresented: Binding<Bool>, url: String) -> some View {
        modifier(SafariCover(isPresented, url: UniversalURL(url)))
    }
    
    func safariCover(_ isPresented: Binding<Bool>, url: URL) -> some View {
        modifier(SafariCover(isPresented, url: UniversalURL(url)))
    }
}

#endif
#endif
