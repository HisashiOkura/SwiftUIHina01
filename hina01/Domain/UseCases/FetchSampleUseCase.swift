struct FetchSampleUseCase: Sendable {
    private let repository: any SampleRepository

    init(repository: any SampleRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Sample] {
        try await repository.fetchAll()
    }
}
