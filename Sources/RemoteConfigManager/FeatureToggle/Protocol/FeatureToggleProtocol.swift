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
    public let enabled: Bool
    public let value: T?
}
