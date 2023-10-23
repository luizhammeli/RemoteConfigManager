import FirebaseRemoteConfig
import XCTest
@testable import RemoteConfigManager

final class FeatureToggleTests: XCTestCase {
    func test_initiateRemoteConfig_shouldSetConfigSettings() {
        let spy = RemoteConfigProtocolSpy()
        FirebaseFeatureToggle.initiateRemoteConfig(remoteConfigClient: spy)
        
        XCTAssertEqual(spy.configSettingsCallCount, 1)
        XCTAssertEqual(spy.configSettings.minimumFetchInterval, 0)
    }
    
    func test_initiateRemoteConfig_shouldActivateWhenFetchSucceed() {
        let spy = RemoteConfigProtocolSpy()
        FirebaseFeatureToggle.initiateRemoteConfig(remoteConfigClient: spy)
        spy.complete(with: .success)
        
        XCTAssertTrue(spy.didActivate)
    }
    
    func test_initiateRemoteConfig_shouldNotActivateWhenFetchFails() {
        let spy = RemoteConfigProtocolSpy()
        FirebaseFeatureToggle.initiateRemoteConfig(remoteConfigClient: spy)
        spy.complete(with: .failure)
        
        XCTAssertFalse(spy.didActivate)
    }
    
    func test_fetch_shouldReturnCorrectValue() {
        let (sut, _) = makeSut()
        let value: ToggleModel<String>? = sut.fetch(key: "test")

        XCTAssertEqual(value?.enabled, true)
        XCTAssertEqual(value?.value, "test")
    }
    
    func test_fetch_shouldReturnNilWithInvalidModel() {
        let (sut, spy) = makeSut()
        spy.configValue = FakeRemoteConfigValue(value: "value")
        let value: ToggleModel<String>? = sut.fetch(key: "test")

        XCTAssertNil(value)
    }
    
    func test_fetch_shouldReturnNilWithoutKeyResult() {
        let (sut, spy) = makeSut()
        spy.configValue = FakeRemoteConfigValue(value: nil)
        let value: ToggleModel<String>? = sut.fetch(key: "test")

        XCTAssertNil(value)
    }
}

private extension FeatureToggleTests {
    func makeSut() -> (FirebaseFeatureToggle, RemoteConfigProtocolSpy) {
        let spy = RemoteConfigProtocolSpy()
        let sut = FirebaseFeatureToggle(remoteConfigClient: spy)
        return (sut, spy)
    }
}
