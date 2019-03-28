
import QRoute

protocol RoutableCompleting {
    func complete(_ routable: QRoutable)
}

class RoutableCompleter: RoutableCompleting {
    let completion: QRouteResolving.Completion

    init(_ completion: @escaping QRouteResolving.Completion) {
        self.completion = completion
    }

    func complete(_ routable: QRoutable) {
        completion(routable)
    }

}
