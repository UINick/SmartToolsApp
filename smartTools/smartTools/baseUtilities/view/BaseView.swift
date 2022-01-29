//
//  BaseView.swift
//  smartTools
//
//  Created by Nicholas Forte on 29/01/22.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = UIColor.systemBackground
    }
}
