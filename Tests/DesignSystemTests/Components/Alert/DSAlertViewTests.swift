import SnapshotTesting
import XCTest

@testable import DesignSystem

final class DSAlertViewTests: XCTestCase {

    func testSnapshots() {

        for kind in AlertKind.allCases {
            let alertView = DSAlertView(kind: kind, message: "Message")
            assertSnapshot(of: alertView, as: .image(layout: .device(config: .iPhone13Pro)))
        }
    }
}
