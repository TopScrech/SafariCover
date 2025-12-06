#if canImport(SafariServices)
import SwiftUI
import SafariServices

struct UniversalURL {
    var urlRepresentation: URL?
    
    init(_ urlString: String) {
        urlRepresentation = URL(string: urlString)
    }
    
    init(_ url: URL) {
        urlRepresentation = url
    }
}

#if !os(macOS)
struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    init?(_ urlString: String) {
        guard let url = URL(string: urlString) else { return nil }
        self.url = url
    }
    
    init(_ url: URL) {
        self.url = url
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
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
        if let url = url.urlRepresentation {
            content
                .fullScreenCover(isPresented: $isPresented) {
                    SafariView(url)
                        .ignoresSafeArea()
                }
        } else {
            content
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
