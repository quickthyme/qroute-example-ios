
import UIKit
import QRoute

class MessageCenterInjector: NSObject {
    @IBOutlet weak var viewController: MessageCenterViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.MessageCenter)!,
            toChild: ToChildUIStoryboardNavigationControllerPushResolverAction(),
            toParent: ToParentNavigationControllerPopResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
