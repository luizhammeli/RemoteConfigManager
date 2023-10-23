//
//  RemoteConfigProtocol.swift
//  
//
//  Created by Luiz Diniz Hammerli on 22/10/23.
//

import FirebaseRemoteConfig

public protocol RemoteConfigProtocol: AnyObject {
    var configSettings: RemoteConfigSettings { get set }
    func configValue(forKey key: String?) -> RemoteConfigValue
    func fetch(completionHandler: ((RemoteConfigFetchStatus, Error?) -> Void)?)
    func activate(completion: ((Bool, Error?) -> Void)?)
}

extension RemoteConfig: RemoteConfigProtocol {}
