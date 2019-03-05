
import UIKit
import QRoute

class ToDoDetailViewController: UIViewController, QRoutable {
    var routeResolver: QRouteResolving?
    var routeDriver: QRouteDriving?

    var routeInput: QRoutableInput? {
        didSet {
            self.navigationItem.title = "Item \(routeInput?["toDoId"] as? Int ?? -1)"
        }
    }

    @IBAction func contactUsNearAction(_ sender: AnyObject?) {
        routeDriver?.driveSub(AppRoute.id.ContactUs, from: self, input: nil,
                              animated: true,
                              completion: nil)
    }

    @IBAction func contactUsFarAction(_ sender: AnyObject?) {
        routeDriver?.driveTo(AppRoute.id.ContactUs, from: self, input: nil,
                             animated: true,
                             completion: nil)
    }
}
