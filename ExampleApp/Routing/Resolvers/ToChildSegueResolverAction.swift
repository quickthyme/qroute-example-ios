
import UIKit
import QTRoute

func ToChildSegueResolverAction(segueId: String) -> QTRouteResolver.ActionType.ToChild {
    return { route, from, input, animated, completion in
        guard let vc = from as? UIViewController else { return }
        let completer = RoutableCompleter(completion)
        vc.performSegue(withIdentifier: segueId, sender: completer)
    }
}
