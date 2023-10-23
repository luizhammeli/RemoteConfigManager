//
//  FakeRemoteConfigValue.swift
//  
//
//  Created by Luiz Diniz Hammerli on 22/10/23.
//

import FirebaseRemoteConfig

final class FakeRemoteConfigValue: RemoteConfigValue {
    private var value: String?
    
    init(value: String? =  "{\"enabled\": true, \"value\": \"test\"}") {
        self.value = value
    }
    
    override var stringValue: String? {
       value
    }
}
