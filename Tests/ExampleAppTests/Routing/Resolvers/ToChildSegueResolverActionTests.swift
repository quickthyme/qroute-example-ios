
import XCTest
import UIKit
import QRoute

func XToChildSegueResolverAction(segueId: String) -> QRouteResolver.ActionType.ToChild {
    return { route, from, input, animated, completion in
        guard let vc = from as? UIViewController else { return }
        let completer = RoutableCompleter(completion)
        vc.performSegue(withIdentifier: segueId, sender: completer)
    }
}


class ToChildSegueResolverActionTests: XCTestCase {

    let subject: QRouteResolver.ActionType.ToChild =
        ToChildSegueResolverAction(segueId: "segway")

    let inputStream: QRouteResolving.Input = [
        "somethingForSusan":"123.45.678.910.11.12",
        "somethingForBruce":[1,-1]
    ]

    func test_resolve() {

        given("source, target, inputStream, animated, completion") {
            let target = QRoute("destination")
            let mockRoutable: MockViewControllerRoutable =
                MockViewControllerRoutable(QRoute("source", target))
                    .inMockNavigationController

            when("executed") {
                let (captured, completion) = captureRoutableCompletion()
                subject(target, mockRoutable, inputStream, true, completion)

                then("it should have invoked the segue") {
                    XCTAssertTrue(mockRoutable.wasCalled_performSegue)
                }
                with("correct segue identifier") {
                    XCTAssertEqual(mockRoutable.valueFor_performSegue_identifier, "segway")
                }
                with("sender parameter containing completion wrapped in RoutableCompleter") {
                    XCTAssert(mockRoutable.valueFor_performSegue_sender is RoutableCompleter)
                    when("completer is invoked") {
                        let destinationRoutable = MockViewControllerRoutable(target)
                        (mockRoutable.valueFor_performSegue_sender as! RoutableCompleter)
                            .complete(destinationRoutable)
                        then("it should result correct routable") {
                            let capturedRoutable = (captured.value as? MockViewControllerRoutable)
                            XCTAssertEqual(capturedRoutable?.routeResolver.route, target)
                        }
                    }
                }
            }
        }
    }
}
