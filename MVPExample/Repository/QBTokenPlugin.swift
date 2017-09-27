import Moya

// MARK: - QBTokenAuthorizable

/// A protocol for controlling the behavior of `QBTokenPlugin`.
public protocol QBTokenAuthorizable {
    
    /// Represents the authorization header to use for requests.
    var authorizationType: QBAuthorizationType { get }
}

// MARK: - AuthorizationType

/// An enum representing the header to use with an `AccessTokenPlugin`
public enum QBAuthorizationType: String {
    case none
    case qb
}

// MARK: - AccessTokenPlugin

/**
 A plugin for adding QB token authorization headers to requests. Example:

 */
public struct QBTokenPlugin: PluginType {
    
    /// A closure returning the access token to be applied in the header.
    public let tokenClosure: () -> String
    
    /**
     Initialize a new `AccessTokenPlugin`.
     
     - parameters:
     - tokenClosure: A closure returning the token to be applied in the pattern `Authorization: <AuthorizationType> <token>`
     */
    public init(tokenClosure: @escaping () -> String) {
        self.tokenClosure = tokenClosure
    }
    
    /**
     Prepare a request by adding an authorization header if necessary.
     
     - parameters:
     - request: The request to modify.
     - target: The target of the request.
     - returns: The modified `URLRequest`.
     */
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let authorizable = target as? QBTokenAuthorizable else { return request }
        
        let authorizationType = authorizable.authorizationType
        
        var request = request
        
        switch authorizationType {
        case .qb:
            let authValue = tokenClosure()
            request.addValue(authValue, forHTTPHeaderField: "QB-Token")
        case .none:
            break
        }
        
        return request
    }
}

