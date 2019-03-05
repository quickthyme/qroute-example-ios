
import UIKit
import QRoute

class ToDoInjector: NSObject {
    @IBOutlet weak var viewController: ToDoViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.ToDo)!,
            toChild: ToChildUIStoryboardNavigationControllerPushResolverAction(),
            toParent: ToParentAppRouteRootResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
