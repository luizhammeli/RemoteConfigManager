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
    
    init(remoteConfigClient: RemoteConfig = RemoteConfig.remoteConfig()) {
        self.remoteConfigClient = remoteConfigClient
    }
    
    public static func configure(remoteConfigClient: RemoteConfig = RemoteConfig.remoteConfig()) {
        FirebaseApp.configure()
        FeatureToggle.initiate(remoteConfigClient: remoteConfigClient)
    }
    
    static func initiate(remoteConfigClient: RemoteConfig = RemoteConfig.remoteConfig()) {
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
    
    public func fetch<T>(key: String, completion: (T?) -> Void) {
        guard let value = remoteConfigClient.configValue(forKey: key).stringValue else {
            return completion(nil)
        }
        
        print(value)
    }
}
