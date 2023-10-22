//import FirebaseCore
import FirebaseRemoteConfig
import XCTest
@testable import RemoteConfigManager

final class FeatureToggleTests: XCTestCase {
    func testExample() throws {
        XCTAssertEqual(RemoteConfigManager().text, "Hello, World!")
    }
}

private extension FeatureToggleTests {
    func makeSut() {        
        let sut = FeatureToggle()
    }
}
