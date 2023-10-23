//
//  RemoteConfigProtocolSpy.swift
//  
//
//  Created by Luiz Diniz Hammerli on 22/10/23.
//

import FirebaseRemoteConfig
@testable import RemoteConfigManager

final class RemoteConfigProtocolSpy: RemoteConfigProtocol {
    var configSettingsCallCount = 0
    var didActivate = false
    var configValue = FakeRemoteConfigValue()
    private var completions: [(RemoteConfigFetchStatus, Error?) -> Void] = []

    var configSettings: RemoteConfigSettings = RemoteConfigSettings() {
        didSet {
            configSettingsCallCount += 1
        }
    }

    func activate(completion: ((Bool, Error?) -> Void)?) {
        didActivate = true
    }
    
    func configValue(forKey key: String?) -> RemoteConfigValue {
        configValue
    }
    
    func fetch(completionHandler: ((RemoteConfigFetchStatus, Error?) -> Void)?) {
        completions.append(completionHandler!)
    }
    
    func complete(with status: RemoteConfigFetchStatus, at index: Int = 0) {
        completions[index](status, NSError())
    }
}
