
import UIKit
import QRoute

class RootViewController: UIViewController, QRoutable {
    var routeInput: QRoutableInput?
    var routeResolver: QRouteResolving?
    var routeDriver: QRouteDriving?

    var rootTabBarController: UITabBarController?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabController = segue.destination as? UITabBarController {
            self.rootTabBarController = tabController
        }
    }
}
