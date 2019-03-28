
import UIKit
import QRoute

class RootInjector: NSObject {
    @IBOutlet weak var viewController: RootViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QRouteResolver(
            AppRoute.plan,
            toChild: RootToChildResolver(),
            toParent: QRouteResolver.DefaultAction.ToParentNoOp()
        )
        viewController.routeDriver = AppRoute.driver

        AppRoute.rootRoutable = viewController
    }
}
