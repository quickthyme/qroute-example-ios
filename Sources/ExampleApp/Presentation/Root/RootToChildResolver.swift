
import UIKit
import QRoute

private let RouteTab: [QRouteId:Int] = [
    AppRoute.id.ToDo:0,
    AppRoute.id.Help:1
]

func RootToChildResolver() -> QRouteResolver.ActionType.ToChild {
    return {
        route, from, input, animated, completion in

        guard
            let rootVC = from as? RootViewController,
            let rootTabBarController = rootVC.rootTabBarController,
            let index = RouteTab[route.id]
            else { return /* abort */ }

        rootTabBarController.selectedIndex = index

        if let navWrapper = rootTabBarController.selectedViewController as? UINavigationController {
            navWrapper.popToRootViewController(animated: animated) {

                if let routable = navWrapper.topViewController as? QRoutable {
                    QRouteResolver.mergeInputDependencies(resolver: routable.routeResolver,
                                                          input: input)
                    completion(routable)
                }
            }
        }
    }
}
