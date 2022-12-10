//
//  FeatureToggle.swift
//  
//
//  Created by Luiz Diniz Hammerli on 10/12/22.
//

import FirebaseCore
import FirebaseRemoteConfig
import Foundation

public final class FeatureToggle: FeatureToggleProtocol {
    let remoteConfigClient: RemoteConfig

    public init(remoteConfigClient: RemoteConfig = RemoteConfig.remoteConfig()) {
        self.remoteConfigClient = remoteConfigClient
    }
    
    public static func configure() {
        FirebaseApp.configure()
    }
    
    public static func initiateRemoteConfig(remoteConfigClient: RemoteConfig = RemoteConfig.remoteConfig()) {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfigClient.configSettings = settings
        remoteConfigClient.fetch { status, error in
            if status == .success {
                print("Success fetch remote config data from server")
                remoteConfigClient.activate { _, _ in }
            } else {
                print("Error to fetch remote config data from server")
            }
        }
    }

    public func fetch<T: Codable>(key: String) -> T? {
        guard let value = remoteConfigClient.configValue(forKey: key).stringValue else {
            return nil
        }
        
        guard let decodedValue = try? JSONDecoder().decode(T.self, from: Data(value.utf8)) else { return nil }
        
        return decodedValue
    }
}
