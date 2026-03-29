protocol AuthRepository: Sendable {
    var currentUser: AppUser? { get }
    func signInAnonymously() async throws -> AppUser
    func signIn(email: String, password: String) async throws -> AppUser
    func signUp(email: String, password: String) async throws -> AppUser
    func linkWithEmail(email: String, password: String) async throws -> AppUser
    func signOut() throws
}
