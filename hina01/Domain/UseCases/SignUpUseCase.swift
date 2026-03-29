/// 新規登録。
/// - 匿名ユーザーの場合: link でアップグレード（UID・データを引き継ぐ）
/// - 未ログインの場合: 通常の新規登録
/// - 登録済みユーザーがログイン中の場合: エラー
struct SignUpUseCase: Sendable {
    private let repository: any AuthRepository

    init(repository: any AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> AppUser {
        if let currentUser = repository.currentUser {
            guard currentUser.isAnonymous else {
                throw AuthError.alreadySignedIn
            }
            // 匿名 → 登録済みへアップグレード（UID を維持）
            do {
                return try await repository.linkWithEmail(email: email, password: password)
            } catch AuthError.emailAlreadyInUse {
                // そのメールアドレスはすでに別アカウントで使われている
                // → SignInUseCase での既存アカウントログインを促す
                throw AuthError.emailAlreadyInUse
            }
        }
        // currentUser なし（通常は起動時に匿名ログインしているので到達しないが念のため）
        return try await repository.signUp(email: email, password: password)
    }
}
