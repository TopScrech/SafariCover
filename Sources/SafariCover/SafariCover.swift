import SwiftUI
#if canImport(SafariServices)
import SafariServices

struct UniversalURL {
    var urlRepresentation: URL
    
    static let fallbackURLString = "https://topscrech.dev/invalidurl"
    
    init(_ urlString: String) {
        if let url = URL(string: urlString) {
            urlRepresentation = url
        } else {
            print("Invalid URL string: \(urlString)")
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
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url.urlRepresentation)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

@available(iOS 14.0, *)
struct SafariCover: ViewModifier {
    @Binding var isPresented: Bool
    let url: UniversalURL
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                SafariView(url: url)
                    .ignoresSafeArea()
            }
    }
}

@available(iOS 14.0, *)
public extension View {
    func safariCover(_ isPresented: Binding<Bool>, url: String) -> some View {
        modifier(SafariCover(isPresented: isPresented, url: UniversalURL(url)))
    }
    
    func safariCover(_ isPresented: Binding<Bool>, url: URL) -> some View {
        modifier(SafariCover(isPresented: isPresented, url: UniversalURL(url)))
    }
}
#endif
#endif
