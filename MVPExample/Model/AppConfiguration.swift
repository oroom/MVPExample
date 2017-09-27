import Foundation

class AppConfiguration {
    var apiToken: String?
    private let configurationProvider : TokenProvider
    
    init(configurationProvider: TokenProvider) {
        self.configurationProvider = configurationProvider
    }
    
    func reconfigureApp(completion: @escaping () -> ()) {
        self.configurationProvider.renewToken { [weak self] (token) in
            guard let token = token else {
                return
            }
            self?.apiToken = token
            completion()
        }
    }
}
