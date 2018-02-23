import Foundation
import Moya

protocol TaskService {
    func getTasks(completion: @escaping ([Task]?) -> ())
}

final class TaskServiceImpl: TaskService {
    
    let tokenClosure: () -> (String)
    
    init(tokenClosure: @escaping () -> (String)) {
        self.tokenClosure = tokenClosure
    }
    
    func getTasks(completion: @escaping ([Task]?) -> ()) {
        let provider = MoyaProvider<TasksEndpoints>(plugins: [QBTokenPlugin(tokenClosure: self.tokenClosure),
                                                              NetworkLoggerPlugin(verbose: true)])
        provider.request(.getTasks) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    // TODO: remove next line later
                    let data = try moyaResponse.filterSuccessfulStatusCodes().data
                    _ = String(data: data, encoding: .utf8)!
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    do {
                        let tasksPage = try decoder.decode(TasksPage.self, from: data)
                        let tasks = tasksPage.items
                        completion(tasks)
                    } catch {
                        print(error)
                        completion([Task]())
                    }
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
