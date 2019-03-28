
import UIKit
import QRoute

class ContactUsViewController: UIViewController, QRoutable {
    var routeResolver: QRouteResolving!
    var routeDriver: QRouteDriving?

    @IBAction func dismissAction(_ sender: AnyObject?) {
        routeDriver?.driveParent(from: self, input: nil,
                                 animated: true,
                                 completion: nil)
    }
}
