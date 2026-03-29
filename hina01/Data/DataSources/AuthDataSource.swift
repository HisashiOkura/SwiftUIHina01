import FirebaseAuth

protocol AuthDataSource: Sendable {
    var currentUser: AppUser? { get }
    func signInAnonymously() async throws -> AppUser
    func signIn(email: String, password: String) async throws -> AppUser
    func signUp(email: String, password: String) async throws -> AppUser
    func linkWithEmail(email: String, password: String) async throws -> AppUser
    func signOut() throws
}

final class FirebaseAuthDataSource: AuthDataSource {
    var currentUser: AppUser? {
        Auth.auth().currentUser.map { $0.toAppUser() }
    }

    func signInAnonymously() async throws -> AppUser {
        let result = try await Auth.auth().signInAnonymously()
        return result.user.toAppUser()
    }

    func signIn(email: String, password: String) async throws -> AppUser {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.toAppUser()
    }

    func signUp(email: String, password: String) async throws -> AppUser {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user.toAppUser()
    }

    func linkWithEmail(email: String, password: String) async throws -> AppUser {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.noCurrentUser
        }
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        let result = try await user.link(with: credential)
        return result.user.toAppUser()
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}

private extension User {
    func toAppUser() -> AppUser {
        AppUser(
            uid: uid,
            email: email,
            displayName: displayName,
            isAnonymous: isAnonymous
        )
    }
}
