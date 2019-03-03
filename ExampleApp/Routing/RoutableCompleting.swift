
import QTRoute

protocol RoutableCompleting {
    func complete(_ routable: QTRoutable)
}

class RoutableCompleter: RoutableCompleting {
    let completion: QTRoutableCompletion

    init(_ completion: @escaping QTRoutableCompletion) {
        self.completion = completion
    }

    func complete(_ routable: QTRoutable) {
        completion(routable)
    }

}
