import Foundation

struct AppUser: Sendable {
    let uid: String
    let email: String?
    let displayName: String?
    let isAnonymous: Bool
}
