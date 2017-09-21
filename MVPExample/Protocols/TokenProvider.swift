//
//  TokenProvider.swift
//  MVPExample
//
//  Created by oroom on 9/21/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

protocol TokenProvider {
    func renewToken(completion: @escaping (String?) -> ())
}
