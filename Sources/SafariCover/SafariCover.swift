import SwiftUI
import SafariServices

internal struct UniversalURL {
    var urlRepresentation: URL
    
    init(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL string: \(urlString)")
            self.urlRepresentation = URL(string: "https://www.example.com")!
            return
        }
        self.urlRepresentation = url
    }
    
    init(_ url: URL) {
        self.urlRepresentation = url
    }
}

internal struct SafariView: UIViewControllerRepresentable {
    let url: UniversalURL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: self.url.urlRepresentation)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

@available(iOS 14.0, *)
internal struct SafariCover: ViewModifier {
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
        self.modifier(SafariCover(isPresented: isPresented, url: UniversalURL(url)))
    }
    
//    func safariCover(_ isPresented: Binding<Bool>, url: URL) -> some View {
//        self.modifier(SafariCover(isPresented: isPresented, url: UniversalURL(url)))
//    }
}

@available(iOS 14.0, *)
public extension View {
//    func safariCover(_ isPresented: Binding<Bool>, url: String) -> some View {
//        self.modifier(SafariCover(isPresented: isPresented, url: UniversalURL(url)))
//    }
//    
    func safariCover(_ isPresented: Binding<Bool>, url: URL) -> some View {
        self.modifier(SafariCover(isPresented: isPresented, url: UniversalURL(url)))
    }
}
