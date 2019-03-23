
import UIKit
import QRoute

func ToParentDismissModalResolverAction() -> QRouteResolver.ActionType.ToParent {
    return {
        from, input, animated, completion in

        guard
            let fromVC = from as? UIViewController,
            let presenter = fromVC.presentingViewController
            else { return }

        presenter.dismiss(animated: animated) {

            if let routable = presenter as? QRoutable {
                QRouteResolver.mergeInputDependencies(resolver: routable.routeResolver, input: input)
                completion(routable)
            }
        }
    }
}
