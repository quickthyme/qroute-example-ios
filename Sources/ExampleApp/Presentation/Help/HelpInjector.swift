
import UIKit
import QRoute

class HelpInjector: NSObject {
    @IBOutlet weak var viewController: HelpViewController!

    private struct SegueId {
        static let ToContactUs = "ToContactUs"
        static let ToMessageCenter = "ToMessageCenter"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.Help)!,

            toChild: QRouteResolver.DefaultAction.ToChildSwitch([
                AppRoute.id.ContactUs: ToChildSegueResolverAction(segueId: SegueId.ToContactUs),
                AppRoute.id.MessageCenter: ToChildSegueResolverAction(segueId: SegueId.ToMessageCenter)
                ]),

            toParent: ToParentAppRouteRootResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
