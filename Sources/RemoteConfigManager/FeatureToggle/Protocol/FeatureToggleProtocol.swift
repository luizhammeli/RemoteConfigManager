//
//  FeatureToggleProtocol.swift
//  
//
//  Created by Luiz Diniz Hammerli on 10/12/22.
//

import Foundation

public protocol FeatureToggleProtocol {
    func fetch<T: Codable>(key: String) -> ToggleModel<T>?
}


public struct ToggleModel<T: Codable>: Codable {
    let enabled: Bool
    let value: T?
}
