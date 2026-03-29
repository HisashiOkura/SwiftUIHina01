import Testing
@testable import hina01

struct SignUpUseCaseTests {

    // MARK: - 匿名ユーザーの場合

    @Test func anonymousUser_linksWithEmail() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = .anonymous
        let useCase = SignUpUseCase(repository: mock)

        let user = try await useCase.execute(email: "new@example.com", password: "password")

        #expect(mock.linkCalledWith?.email == "new@example.com")
        #expect(mock.signUpCalledWith == nil)  // signUp は呼ばれない
        #expect(user.uid == AppUser.registered.uid)  // UID が引き継がれる
    }

    @Test func anonymousUser_emailAlreadyInUse_throwsEmailAlreadyInUse() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = .anonymous
        mock.linkResult = .failure(AuthError.emailAlreadyInUse)
        let useCase = SignUpUseCase(repository: mock)

        await #expect(throws: AuthError.emailAlreadyInUse) {
            try await useCase.execute(email: "existing@example.com", password: "password")
        }
    }

    // MARK: - 登録済みユーザーがすでにログイン中の場合

    @Test func registeredUser_throwsAlreadySignedIn() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = .registered
        let useCase = SignUpUseCase(repository: mock)

        await #expect(throws: AuthError.alreadySignedIn) {
            try await useCase.execute(email: "new@example.com", password: "password")
        }
    }

    // MARK: - currentUser なし（フォールバック）

    @Test func noCurrentUser_callsSignUp() async throws {
        let mock = MockAuthRepository()
        mock.currentUser = nil
        let useCase = SignUpUseCase(repository: mock)

        _ = try await useCase.execute(email: "new@example.com", password: "password")

        #expect(mock.signUpCalledWith?.email == "new@example.com")
        #expect(mock.linkCalledWith == nil)
    }
}
