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
    public static func configure() {
        FirebaseApp.configure()
        let settings = RemoteConfigSettings()        
        RemoteConfig.remoteConfig().configSettings = settings
    }
    
    public func fetch<T>(key: String, completion: (T) -> Void) {
        
    }
}
