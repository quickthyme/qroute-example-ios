
import UIKit
import QRoute

class MockViewControllerRoutable: MockViewController, QRoutable {

    var routeResolver: QRouteResolving!

    init(_ route: QRoute? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.routeResolver = MockQRouteResolver(route ?? QRoute("\(type(of: self))"))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override var embeddedInWindow: MockViewControllerRoutable {
        return super.embeddedInWindow as! MockViewControllerRoutable
    }

    override var inMockNavigationController: MockViewControllerRoutable {
        return super.inMockNavigationController as! MockViewControllerRoutable
    }
}
