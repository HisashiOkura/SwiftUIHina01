/// アプリ起動時に呼ぶ。
/// - currentUser がいればそのまま返す
/// - いなければ匿名ログインして返す
struct RestoreOrSignInAnonymouslyUseCase: Sendable {
    private let repository: any AuthRepository

    init(repository: any AuthRepository) {
        self.repository = repository
    }

    func execute() async throws -> AppUser {
        if let user = repository.currentUser {
            return user
        }
        return try await repository.signInAnonymously()
    }
}
