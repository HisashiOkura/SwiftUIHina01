import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            Text("Favorites")
                .font(.noto(.bodyLarge))
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
