import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            Text("Search")
                .font(.noto(.bodyLarge))
                .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
