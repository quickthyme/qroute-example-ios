
import XCTest
import UIKit
import QRoute

class ToParentDismissModalResolverActionTests: XCTestCase {

    let subject: QRouteResolver.ActionType.ToParent =
        ToParentDismissModalResolverAction()

    func test_resolve() {

        given("routable is being presented") {
            let presentedRoute = QRoute("presented")
            let presenterRoute = QRoute("presenter", presentedRoute)
            let presented = MockViewControllerRoutable(presentedRoute)
            let presenter = MockViewControllerRoutable(presenterRoute)

            presenter.present(presented, animated: false)

            when("it is executed") {
                let (captured, completion) = captureRoutableCompletion()
                subject(presented, [:], false, completion)

                then("the presenter routable should dismiss the presented") {
                    XCTAssertTrue(presenter.wasCalled_dismiss)
                }
                with("matching last resolved routable") {
                    XCTAssert(captured.value === presenter)
                }
            }
        }
    }
}
