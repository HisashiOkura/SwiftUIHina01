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
            List(viewModel.samples, id: \.id) { sample in
                Text(sample.title)
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
