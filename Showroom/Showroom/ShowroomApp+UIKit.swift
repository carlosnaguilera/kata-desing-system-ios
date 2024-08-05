import UIKit
import DesignSystem

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let label = UILabel()
        label.text = "UIKit"
        label.textAlignment = .center
        label.backgroundColor = .white

        let viewController = UIViewController()
        viewController.view = label

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = viewController

        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
