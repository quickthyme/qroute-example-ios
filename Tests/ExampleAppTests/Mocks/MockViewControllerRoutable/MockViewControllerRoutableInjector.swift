
import UIKit
import QRoute

class MockViewControllerRoutableInjector: NSObject {
    @IBOutlet weak var viewController: MockViewControllerRoutable!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = MockQRouteResolver(
            QRoute("MockViewControllerRoutable")
        )
    }
}
