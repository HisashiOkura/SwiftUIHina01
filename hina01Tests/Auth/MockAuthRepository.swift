@testable import hina01

final class MockAuthRepository: AuthRepository, @unchecked Sendable {
    var currentUser: AppUser?

    var signInAnonymouslyCalled = false
    var signInCalledWith: (email: String, password: String)?
    var signUpCalledWith: (email: String, password: String)?
    var linkCalledWith: (email: String, password: String)?
    var signOutCalled = false

    var signInAnonymouslyResult: Result<AppUser, Error> = .success(.anonymous)
    var signInResult: Result<AppUser, Error> = .success(.registered)
    var signUpResult: Result<AppUser, Error> = .success(.registered)
    var linkResult: Result<AppUser, Error> = .success(.registered)
    var signOutError: Error?

    func signInAnonymously() async throws -> AppUser {
        signInAnonymouslyCalled = true
        return try signInAnonymouslyResult.get()
    }

    func signIn(email: String, password: String) async throws -> AppUser {
        signInCalledWith = (email, password)
        return try signInResult.get()
    }

    func signUp(email: String, password: String) async throws -> AppUser {
        signUpCalledWith = (email, password)
        return try signUpResult.get()
    }

    func linkWithEmail(email: String, password: String) async throws -> AppUser {
        linkCalledWith = (email, password)
        return try linkResult.get()
    }

    func signOut() throws {
        signOutCalled = true
        if let error = signOutError { throw error }
    }
}

extension AppUser {
    static let anonymous = AppUser(uid: "anon-uid", email: nil, displayName: nil, isAnonymous: true)
    static let registered = AppUser(uid: "reg-uid", email: "test@example.com", displayName: "Test User", isAnonymous: false)
}
