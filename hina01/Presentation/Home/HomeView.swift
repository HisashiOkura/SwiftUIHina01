import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel(
        fetchSampleUseCase: FetchSampleUseCase(
            repository: SampleRepositoryImpl(
                dataSource: SampleRemoteDataSource()
            )
        )
    )

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Welcome to hina01")
                            .font(.inter(.displaySmall))
                        Text("ようこそ hina01 へ")
                            .font(.noto(.headlineMedium))
                        Text("This is Inter body text.")
                            .font(.inter(.bodyLarge))
                        Text("これは Noto Sans JP の本文です。")
                            .font(.noto(.bodyMedium))
                        Text("CAPTION — 補足テキスト")
                            .font(.noto(.caption))
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                } header: {
                    Text("Font Samples")
                        .font(.inter(.labelMedium))
                }

                Section {
                    ForEach(viewModel.samples, id: \.id) { sample in
                        Text(sample.title)
                            .font(.inter(.bodyLarge))
                    }
                } header: {
                    Text("Data")
                        .font(.inter(.labelMedium))
                }
            }
            .navigationTitle("Home")
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .task {
                await viewModel.onAppear()
            }
        }
    }
}

#Preview {
    HomeView()
}
