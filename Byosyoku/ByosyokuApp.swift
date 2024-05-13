import SwiftUI
import FirebaseCore
import FirebaseAppCheck





@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
          AuthenticationView()
      }
    }
  }
}
