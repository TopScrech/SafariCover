import SwiftUI
import SafariServices

@available(iOS 13.0, *)
struct SafariView: UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        guard let link = URL(string: url) else {
            fatalError("Invalid URL string: \(url)")
        }
        return SFSafariViewController(url: link)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

@available(iOS 14.0, *)
struct SafariCoverModifier: ViewModifier {
    @Binding var isPresented: Bool
    let url: String
    
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
        self.modifier(SafariCoverModifier(isPresented: isPresented, url: url))
    }
}
