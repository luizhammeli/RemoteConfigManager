//
//  ContentView.swift
//  SampleApp
//
//  Created by Luiz Diniz Hammerli on 22/10/23.
//

import SwiftUI
import RemoteConfigManager

struct ContentView: View {
    private let featureToggle: FeatureToggleProtocol
    @State var toggleModel: ToggleModel<String>? = nil
    
    init(featureToggle: FeatureToggleProtocol = FirebaseFeatureToggle()) {
        self.featureToggle = featureToggle
    }
    
    var body: some View {
        VStack(spacing: 10) {
            if (toggleModel?.enabled) ?? false {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("\(toggleModel?.value ?? "")  ✅")
            } else {
                Text("Feature Disabled ❌")
            }
        }
        .padding()
        .onAppear(perform: {
            self.toggleModel = featureToggle.fetch(key: "remote_config_test")
        })
    }
}

#Preview {
    ContentView()
}
