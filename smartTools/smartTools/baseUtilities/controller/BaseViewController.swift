//
//  BaseViewController.swift
//  smartTools
//
//  Created by Nicholas Forte on 29/01/22.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController<CustomView: UIView>: UIViewController {

    internal let baseViewModel: BaseViewModelProtocol
    internal var disposeBag: DisposeBag!

    init(viewModel: BaseViewModelProtocol, nibName: String?) {
        baseViewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
        modalPresentationStyle = .custom
    }

    init(viewModel: BaseViewModelProtocol) {
        baseViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
    }

    convenience required init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }

    var customView: CustomView! {
        return self.view as? CustomView
    }

    override func loadView() {
        self.view = CustomView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesBackButton = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    deinit {
        print("dealloc ---> \(String(describing: type(of: self)))")
    }
}
