final class AuthRepositoryImpl: AuthRepository {
    private let dataSource: any AuthDataSource

    init(dataSource: any AuthDataSource) {
        self.dataSource = dataSource
    }

    var currentUser: AppUser? {
        dataSource.currentUser
    }

    func signInAnonymously() async throws -> AppUser {
        try await dataSource.signInAnonymously()
    }

    func signIn(email: String, password: String) async throws -> AppUser {
        try await dataSource.signIn(email: email, password: password)
    }

    func signUp(email: String, password: String) async throws -> AppUser {
        try await dataSource.signUp(email: email, password: password)
    }

    func linkWithEmail(email: String, password: String) async throws -> AppUser {
        try await dataSource.linkWithEmail(email: email, password: password)
    }

    func signOut() throws {
        try dataSource.signOut()
    }
}
