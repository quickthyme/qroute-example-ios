
import UIKit
import QTRoute

class RootInjector: NSObject {
    @IBOutlet weak var viewController: RootViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QTRouteResolver(
            AppRoute.plan,
            toChild: RootToChildResolver(),
            toParent: QTRouteResolver.DefaultAction.ToParentNoOp()
        )
        viewController.routeDriver = AppRoute.driver

        AppRoute.rootRoutable = viewController
    }
}
