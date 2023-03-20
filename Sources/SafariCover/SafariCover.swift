import SwiftUI
import SafariServices

struct UniversalURL {
    var urlRepresentation: URL
    
    init?(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL string: \(urlString)")
            return nil
        }
        self.urlRepresentation = url
    }
    
    init(_ url: URL) {
        self.urlRepresentation = url
    }
}

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
    func safariCover(_ isPresented: Binding<Bool>, url: URL?) -> some View {
        let fallbackURL = URL(string: "https://topscrech.dev/invalidurl")!
        let universalURL = url.map(UniversalURL.init) ?? UniversalURL(fallbackURL)
        return modifier(SafariCover(isPresented: isPresented, url: universalURL))
    }
}
