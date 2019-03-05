
import QRoute

protocol RoutableCompleting {
    func complete(_ routable: QRoutable)
}

class RoutableCompleter: RoutableCompleting {
    let completion: QRoutableCompletion

    init(_ completion: @escaping QRoutableCompletion) {
        self.completion = completion
    }

    func complete(_ routable: QRoutable) {
        completion(routable)
    }

}
