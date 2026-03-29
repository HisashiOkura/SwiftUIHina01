enum AuthError: Error, Sendable {
    /// currentUser が存在しない
    case noCurrentUser
    /// すでに登録済みアカウントでログイン中
    case alreadySignedIn
    /// 匿名ユーザーではないため link できない
    case notAnonymous
    /// link 先メールアドレスがすでに別アカウントで使用済み
    case emailAlreadyInUse
}
