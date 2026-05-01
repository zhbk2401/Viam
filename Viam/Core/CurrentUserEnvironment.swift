import SwiftUI

private struct CurrentUserKey: EnvironmentKey {
    static let defaultValue = UserInfo()
}

extension EnvironmentValues {
    var currentUser: UserInfo {
        get { self[CurrentUserKey.self] }
        set { self[CurrentUserKey.self] = newValue }
    }
}
