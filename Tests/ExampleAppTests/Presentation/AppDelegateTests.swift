
import XCTest

class AppDelegateTests: XCTestCase {

    var subject: AppDelegate!

    override func setUp() {
        subject = AppDelegate()
    }

    func test_when_finished_launching_it_returns_true() {
        let app = UIApplication.shared
        XCTAssertTrue(subject.application(app, didFinishLaunchingWithOptions: nil))
    }
}
