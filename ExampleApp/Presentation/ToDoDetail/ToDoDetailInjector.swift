
import UIKit
import QRoute

class ToDoDetailInjector: NSObject {
    @IBOutlet weak var viewController: ToDoDetailViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.ToDoDetail)!,
            toChild: ToChildUIStoryboardPresentModalResolverAction(),
            toParent: ToParentNavigationControllerPopResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
