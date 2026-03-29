import Testing
@testable import hina01

struct RestoreOrSignInAnonymouslyUseCaseTests {

    // MARK: - currentUser がいる場合

    @Test func currentUserExists_returnsCurrentUser() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = .registered
        let useCase = RestoreOrSignInAnonymouslyUseCase(repository: mock)

        let user = try await useCase.execute()

        #expect(user.uid == AppUser.registered.uid)
        #expect(mock.signInAnonymouslyCalled == false)
    }

    // MARK: - currentUser がいない場合

    @Test func noCurrentUser_signsInAnonymously() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = nil
        let useCase = RestoreOrSignInAnonymouslyUseCase(repository: mock)

        let user = try await useCase.execute()

        #expect(user.isAnonymous == true)
        #expect(mock.signInAnonymouslyCalled == true)
    }

    @Test func noCurrentUser_signInAnonymouslyFails_throwsError() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = nil
        mock.signInAnonymouslyResult = .failure(AuthError.noCurrentUser)
        let useCase = RestoreOrSignInAnonymouslyUseCase(repository: mock)

        await #expect(throws: AuthError.noCurrentUser) {
            try await useCase.execute()
        }
    }
}
