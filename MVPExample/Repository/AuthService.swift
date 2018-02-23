import Foundation
import Moya

class AuthService: TokenProvider  {
    
    func renewToken(completion: @escaping (String?) -> ()) {
        let provider = MoyaProvider<TasksEndpoints>()
        let appId = 62651
        let authKey = "vWSUYyXfbXF48cR"
        let timestamp = Int(Date().timeIntervalSince1970)
        let nonce = Int(arc4random_uniform(UInt32.max))
        let signature = TasksEndpoints.signature(appId: appId, authKey: authKey, timestamp: timestamp, nonce: nonce)
        provider.request(.applicationAuthentification(appId: appId, signature: signature, authKey: authKey, timestamp: timestamp, nonce: nonce)) { result in
            switch result {
                case let .success(moyaResponse):
                do {
                    _ = String(data: moyaResponse.request!.httpBody!, encoding: .utf8)
                    try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try moyaResponse.mapJSON() as! Dictionary<String,Any>
                    if let token = (data["session"] as! Dictionary<String,Any>)["token"] as? String {
                        completion(token)
                    }
                    completion(nil)
                }
                catch {
                    completion(nil)
                }
            case .failure(_):
                    completion(nil)
            }
        }
    }
}
