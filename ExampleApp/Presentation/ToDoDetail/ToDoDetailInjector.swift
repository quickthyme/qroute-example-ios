
import UIKit
import QTRoute

class ToDoDetailInjector: NSObject {
    @IBOutlet weak var viewController: ToDoDetailViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QTRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.ToDoDetail)!,
            toChild: ToChildUIStoryboardPresentModalResolverAction(),
            toParent: ToParentNavigationControllerPopResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
