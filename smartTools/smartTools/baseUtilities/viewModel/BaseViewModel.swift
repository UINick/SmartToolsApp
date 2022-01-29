//
//  BaseViewModel.swift
//  smartTools
//
//  Created by Nicholas Forte on 29/01/22.
//

import UIKit
import RxSwift
import RxCocoa

protocol BaseViewModelProtocol {
    var toastSuccess: Observable<String> { get }
    var toastError: Observable<String> { get }
}

class BaseViewModel: NSObject {
    
    internal let toastErrorSubject = PublishSubject<String>()
    internal let toastSuccessSubject = PublishSubject<String>()
}

// MARK: - BasePresenterProtocol
extension BaseViewModel: BaseViewModelProtocol {
    
    var toastSuccess: Observable<String> {
        return toastSuccessSubject.asObservable()
    }
    var toastError: Observable<String> {
        return toastErrorSubject.asObservable()
    }
}
