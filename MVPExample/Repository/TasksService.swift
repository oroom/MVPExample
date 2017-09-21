//
//  TasksService.swift
//  MVPExample
//
//  Created by oroom on 9/21/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation
import Moya

enum TasksService {
    case applicationAuthentification(appId: Int, signature: String, authKey: String, timestamp: Int, nonce: Int)
    case getTasks
    
    static func signature(appId: Int, authKey: String, timestamp: Int, nonce: Int) -> String {
        let body = "application_id=\(appId)&auth_key=\(authKey)&nonce=\(nonce)&timestamp=\(timestamp)"
        return CryptoAlgorithm.SHA1.hmac(body: body, key: "AN2wsarhe86vuSg")
    }
}

// MARK: TargetType protocol implementation
extension TasksService: TargetType, QBTokenAuthorizable {
    
    var baseURL: URL { return   URL(string: "https://api.quickblox.com")!}
    
    var path: String {
        switch self {
        case .applicationAuthentification(_, _, _, _, _):
            return "/session.json"
        case .getTasks:
            return "/Task.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .applicationAuthentification(_, _, _, _, _):
            return .post
        case .getTasks:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTasks: // Send no parameters
            return .requestPlain
        case let .applicationAuthentification(appId, signature, authKey, timestamp, nonce):
            // Always send parameters as JSON in request body
            return .requestParameters(parameters: ["application_id": appId,
                                                   "signature": signature,
                                                   "auth_key": authKey,
                                                   "timestamp": timestamp,
                                                   "nonce": nonce],
                                      encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {
        case .getTasks:
            return """
                   {"class_name":"Task","skip":0,"limit":100,"items":[
                       {
                           "_id":"59c37d87a0eb47741be67a4b",
                           "_parent_id":"",
                           "created_at":1505983879,
                           "description":"We need to use some service for storing tasks and access them via rest API",
                           "status":0,
                           "title":"Implement rest API for tasks",
                           "updated":"2017-09-21T11:51:19Z",
                           "updated_at":1505983879,
                           "user_id":17316846},
                       {
                           "_id":"59c37dd2a0eb4768c6e679f3",
                           "_parent_id":"",
                           "created_at":1505983954,
                           "description":"Need to publish app to GitHub",
                           "status":0,
                           "title":"Publish example to GitHub",
                           "updated":"2017-09-21T11:52:00Z",
                           "updated_at":1505983954,
                           "user_id":17316846
                        }
                   ]
                   }
                   """.utf8Encoded
        case .applicationAuthentification(let appId,let signature,let authKey,let timestamp,let nonce):
            return """
                   {"session":
                    {"application_id":\(appId),"created_at":"2017-09-21T09:09:13Z","id":374974178,"nonce":\(nonce),"token":"c4a16b9d4e37ad359fa3eeb81ab03fc92200f4bb","ts":\(timestamp),"updated_at":"2017-09-21T09:09:13Z","user_id":0,"_id":"374974178"
                    }
                   }
                   """.utf8Encoded
        }
    }
        
    var headers: [String: String]? {
        switch self {
        case .getTasks:
            return [:]
        case .applicationAuthentification(_, _, _, _, _):
            return ["Content-Type": "application/json", "QuickBlox-REST-API-Version": "0.1.0"]
        }
    }
    
    // MARK:  QBTokenAutorizable
    var authorizationType: QBAuthorizationType {
        switch self {
        case .getTasks:
            return .qb
        case .applicationAuthentification(_, _, _, _, _):
            return .none
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
