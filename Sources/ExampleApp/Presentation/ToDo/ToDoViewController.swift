
import UIKit
import QRoute

class ToDoViewController: UIViewController, QRoutable {
    var routeResolver: QRouteResolving!
    var routeDriver: QRouteDriving?
}

extension ToDoViewController: ToDoTableViewManagerDelegate {
    func toDoTableViewManager(_ manager: ToDoTableViewManager, didSelectId id: Int) {
        routeDriver?.driveTo(AppRoute.id.ToDoDetail,
                             from: self,
                             input: ["toDoId": id],
                             animated: true,
                             completion: nil)
    }
}
