final class SampleRepositoryImpl: SampleRepository {
    private let dataSource: any SampleDataSource

    init(dataSource: any SampleDataSource) {
        self.dataSource = dataSource
    }

    func fetchAll() async throws -> [Sample] {
        try await dataSource.fetchAll()
    }
}
