import Testing
@testable import hina01

struct SignInUseCaseTests {

    // MARK: - 匿名ユーザーがいる場合

    @Test func anonymousUser_signOutThenSignIn() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = .anonymous
        let useCase = SignInUseCase(repository: mock)

        let user = try await useCase.execute(email: "test@example.com", password: "password")

        #expect(mock.signOutCalled == true)
        #expect(mock.signInCalledWith?.email == "test@example.com")
        #expect(user.isAnonymous == false)
    }

    // MARK: - currentUser なし

    @Test func noCurrentUser_signInDirectly() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = nil
        let useCase = SignInUseCase(repository: mock)

        _ = try await useCase.execute(email: "test@example.com", password: "password")

        #expect(mock.signOutCalled == false)
        #expect(mock.signInCalledWith?.email == "test@example.com")
    }

    // MARK: - サインイン失敗

    @Test func signInFails_throwsError() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = nil
        mock.signInResult = .failure(AuthError.noCurrentUser)
        let useCase = SignInUseCase(repository: mock)

        await #expect(throws: AuthError.noCurrentUser) {
            try await useCase.execute(email: "test@example.com", password: "password")
        }
    }
}
