//
//  AppConfiguration.swift
//  MVPExample
//
//  Created by oroom on 9/21/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

class AppConfiguration {
    var apiToken: String?
    private let configurationProvider : TokenProvider
    
    init(configurationProvider: TokenProvider) {
        self.configurationProvider = configurationProvider
    }
    
    func reconfigureApp() {
        self.configurationProvider.renewToken { [weak self] (token) in
            guard let token = token else {
                return
            }
            self?.apiToken = token
        }
    }
}
