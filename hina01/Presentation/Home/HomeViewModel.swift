import Foundation
import Observation

@MainActor
@Observable
final class HomeViewModel {
    private(set) var samples: [Sample] = []
    private(set) var isLoading = false

    private let fetchSampleUseCase: FetchSampleUseCase

    init(fetchSampleUseCase: FetchSampleUseCase) {
        self.fetchSampleUseCase = fetchSampleUseCase
    }

    func onAppear() async {
        isLoading = true
        defer { isLoading = false }
        do {
            samples = try await fetchSampleUseCase.execute()
        } catch {
            // TODO: エラーハンドリング
        }
    }
}
