import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Text("Settings")
                .font(.noto(.bodyLarge))
                .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
