
import UIKit
import QRoute

class MessageCenterViewController: UIViewController, QRoutable {
    var routeResolver: QRouteResolving!
    var routeDriver: QRouteDriving?

    @IBAction func playAction(_ sender: AnyObject?) {
        routeDriver?.driveSub(routeResolver.route.id, from: self, input: nil,
                              animated: true,
                              completion: nil)
    }
}
