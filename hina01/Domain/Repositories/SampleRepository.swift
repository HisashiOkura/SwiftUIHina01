protocol SampleRepository: Sendable {
    func fetchAll() async throws -> [Sample]
}
