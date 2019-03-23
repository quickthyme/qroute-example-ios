
import UIKit
import QRoute

func ToChildUIStoryboardNavigationControllerPushResolverAction() -> QRouteResolver.ActionType.ToChild {
    return { route, from, input, animated, completion in
        guard
            let fromVC = from as? UIViewController,
            let vc = StoryboardLoader.loadViewController(from: route.id),
            let vcRoutable = vc as? QRoutable
            else { return }

        QRouteResolver.mergeInputDependencies(resolver: vcRoutable.routeResolver, input: input)
        fromVC.navigationController?.pushViewController(vc, animated: animated, completion: {
            completion(vcRoutable)
        })
    }
}
