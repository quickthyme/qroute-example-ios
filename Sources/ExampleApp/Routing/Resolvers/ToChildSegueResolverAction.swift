
import UIKit
import QRoute

func ToChildSegueResolverAction(segueId: String) -> QRouteResolver.ActionType.ToChild {
    return { route, from, input, animated, completion in
        guard let vc = from as? UIViewController else { return }
        let completer = RoutableCompleter(completion)
        vc.performSegue(withIdentifier: segueId, sender: completer)
    }
}
