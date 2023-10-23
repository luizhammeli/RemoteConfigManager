//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by Luiz Diniz Hammerli on 22/10/23.
//

import SwiftUI
import RemoteConfigManager

@main
struct SampleAppApp: App {
    init() {
        FirebaseFeatureToggle.configure()
        FirebaseFeatureToggle.initiateRemoteConfig()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
