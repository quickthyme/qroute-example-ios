
import QTRoute

func ToParentAppRouteRootResolverAction() -> QTRouteResolver.ActionType.ToParent {
    return {
        from, input, animated, completion in
        guard let parent = AppRoute.rootRoutable else { return /* abort */ }
        completion(parent)
    }
}
