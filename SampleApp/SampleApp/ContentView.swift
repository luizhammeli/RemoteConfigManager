//
//  ContentView.swift
//  SampleApp
//
//  Created by Luiz Diniz Hammerli on 22/10/23.
//

import SwiftUI
import RemoteConfigManager

struct ContentView: View {
    let featureToggle: FeatureToggleProtocol
    @State var toggleModel: ToggleModel<String>? = nil
    
    init(featureToggle: FeatureToggleProtocol = FirebaseFeatureToggle()) {
        self.featureToggle = featureToggle
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if (toggleModel?.enabled) ?? false {
                Text(toggleModel?.value ?? "")
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
