import Foundation

protocol TokenProvider {
    func renewToken(completion: @escaping (String?) -> ())
}
