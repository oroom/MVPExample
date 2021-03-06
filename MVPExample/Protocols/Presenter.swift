import Foundation

/// MVP Presenter requirements
protocol Presenter: class {
    
    associatedtype PresentedView: View
    func attachView(view: PresentedView)
}

/// Base class for all presenters
class BasePresenter<V: View>: Presenter {
    weak var view: V!
    
    typealias PresentedView = V
    func attachView(view: V) {
        self.view = view
    }
}

/// Wrapper for type erasure
class AnyPresenter<TView: View>: Presenter {
    typealias PresentedView = TView
    private let _attachView: (TView) -> (Void)
    
    func attachView(view: PresentedView) {
        _attachView(view)
    }
    
    
    init<TPresenter: Presenter>(presenter: TPresenter) where TPresenter.PresentedView == PresentedView {
        _attachView = presenter.attachView
    }
}
