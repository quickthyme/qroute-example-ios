
import UIKit
import QRoute

func ToChildUIStoryboardPresentModalResolverAction() -> QRouteResolver.ActionType.ToChild {
    return { route, from, input, animated, completion in
        guard
            let fromVC = from as? UIViewController,
            let vc = StoryboardLoader.loadViewController(from: route.id),
            let vcRoutable = vc as? QRoutable
            else { return }

        QRouteResolver.mergeInputDependencies(target: vcRoutable, input: input)
        fromVC.present(vc, animated: animated) {
            completion(vcRoutable)
        }
    }
}
