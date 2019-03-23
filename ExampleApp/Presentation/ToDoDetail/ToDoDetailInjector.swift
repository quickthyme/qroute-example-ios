
import UIKit
import QRoute

class ToDoDetailInjector: NSObject {
    @IBOutlet weak var viewController: ToDoDetailViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        viewController.routeResolver = QRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.ToDoDetail)!,
            toChild: ToChildUIStoryboardPresentModalResolverAction(),
            toParent: ToParentNavigationControllerPopResolverAction(),
            onInput: getRouteInputHandler(viewController))

        viewController.routeDriver = AppRoute.driver
    }

    func getRouteInputHandler(_ vc: ToDoDetailViewController) -> (QRouteResolving.Input)->() {
        return {
            let id: Int = ($0["toDoId"] as? Int) ?? -1
            vc.navigationItem.title = "Item \(id)"
        }
    }
}
