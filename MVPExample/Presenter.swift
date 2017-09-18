//
//  Presenter.swift
//  MVPExample
//
//  Created by oroom on 9/14/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

protocol Presenter: class {
    
    associatedtype PresentedView: View
    func attachView(view: PresentedView)
}

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

class BasePresenter<V: View>: Presenter {
    private weak var view: V?
    
    typealias PresentedView = V
    func attachView(view: V) {
        self.view = view
    }
}
