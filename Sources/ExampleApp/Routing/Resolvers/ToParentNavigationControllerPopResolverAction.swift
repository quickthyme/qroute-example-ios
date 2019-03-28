
import UIKit
import QRoute

func ToParentNavigationControllerPopResolverAction() -> QRouteResolver.ActionType.ToParent {
    return {
        from, input, animated, completion in

        guard let fromVC = from as? UIViewController,
            let navController = fromVC.navigationController else { return }

        navController.popViewController(animated: animated) {

            if let parent = navController.topViewController as? QRoutable {
                QRouteResolver.mergeInputDependencies(resolver: parent.routeResolver, input: input)
                completion(parent)
            }
        }
    }
}
