
import UIKit
import QRoute

class ContactUsInjector: NSObject {
    @IBOutlet weak var viewController: ContactUsViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.ContactUs)!,
            toChild: QRouteResolver.DefaultAction.ToChildNoOp(),
            toParent: ToParentDismissModalResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
