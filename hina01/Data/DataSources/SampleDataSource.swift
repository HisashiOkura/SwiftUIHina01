protocol SampleDataSource: Sendable {
    func fetchAll() async throws -> [Sample]
}

final class SampleRemoteDataSource: SampleDataSource {
    func fetchAll() async throws -> [Sample] {
        // TODO: API実装
        return []
    }
}
