//
//  TMBarLayoutStackView.swift
//  Tabman
//
//  Created by Merrick Sapsford on 02/09/2018.
//  Copyright © 2020 UI At Six. All rights reserved.
//

import UIKit

/// Layout stack view for use within a bar view.
internal final class TMBarLayoutStackView: UIView {
    
    // MARK: Properties
    
    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Init
    
    init(with mainView: UIView) {
        super.init(frame: .zero)
        initialize(with: mainView)
    }
    
    @available(*, unavailable)
    init() {
        fatalError("Use init(with mainView:)")
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("Use init(with mainView:)")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(with mainView:)")
    }
    
    private func initialize(with view: UIView) {
        addSubview(verticalStack)
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        verticalStack.addArrangedSubview(view)
    }
    
    // MARK: Layout
    
    func addTopSubview(_ view: UIView) {
        verticalStack.insertArrangedSubview(view, at: 0)
    }
    
    func addBottomSubview(_ view: UIView) {
        verticalStack.addArrangedSubview(view)
    }
}
