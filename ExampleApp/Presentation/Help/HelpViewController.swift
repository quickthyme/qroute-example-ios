
import UIKit
import QTRoute

class HelpViewController: UIViewController, QTRoutable {
    var routeInput: QTRoutableInput?
    var routeResolver: QTRouteResolving?
    var routeDriver: QTRouteDriving?

    @IBAction func messageCenterAction(_ sender: AnyObject?) {
        routeDriver?.driveTo(AppRoute.id.MessageCenter, from: self, input: nil,
                             animated: true,
                             completion: nil)
    }

    @IBAction func contactUsAction(_ sender: AnyObject?) {
        routeDriver?.driveTo(AppRoute.id.ContactUs, from: self, input: nil,
                             animated: true,
                             completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let target = segue.destination as? QTRoutable,
            let completer = sender as? RoutableCompleting
            else { return }
        completer.complete(target)
    }
}
