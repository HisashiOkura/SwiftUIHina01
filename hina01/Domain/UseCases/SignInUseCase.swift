/// 登録済みアカウントでログイン。
/// - 匿名ユーザーがいる場合: サインアウトしてから登録済みアカウントでログイン
///   （匿名時のデータは UID が変わるため引き継がれない。
///     データ移行が必要な場合はアプリ側でこの UseCase の前後に処理を追加すること）
struct SignInUseCase: Sendable {
    private let repository: any AuthRepository

    init(repository: any AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> AppUser {
        // 匿名セッションを破棄してから登録済みアカウントでログイン
        if let currentUser = repository.currentUser, currentUser.isAnonymous {
            try repository.signOut()
        }
        return try await repository.signIn(email: email, password: password)
    }
}
