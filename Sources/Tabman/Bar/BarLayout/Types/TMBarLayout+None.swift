//
//  TMBarLayout+None.swift
//  Tabman
//
//  Created by Merrick Sapsford on 28/09/2018.
//  Copyright © 2020 UI At Six. All rights reserved.
//

import UIKit

extension TMBarLayout {
    
    /// Layout that won't display any visible bar buttons.
    ///
    /// The indicator will be visible and equally distributed in the layout width.
    public final class None: TMBarLayout {
        
        // MARK: Properties
        
        //swiftlint:disable unused_setter_value
        @available(*, unavailable)
        public override var contentMode: TMBarLayout.ContentMode {
            get {
                return super.contentMode
            }
            set {
                fatalError("\(type(of: self)) does not support updating contentMode")
            }
        }
        
        // MARK: Init
        
        /// :nodoc:
        public required init() {
            super.init()
            
            super.contentMode = .fit
        }
        
        // MARK: Lifecycle
        
        /// :nodoc:
        public override func focusArea(for position: CGFloat, capacity: Int) -> CGRect {
            guard capacity != 0 else {
                return .zero
            }
            
            let viewWidth = view.bounds.size.width
            let buttonWidth = viewWidth / CGFloat(capacity)
            
            let proposedX = buttonWidth * position
            let constrainedX = max(0.0, min(proposedX, viewWidth - buttonWidth))
            
            return CGRect(x: constrainedX,
                          y: 0.0,
                          width: buttonWidth,
                          height: 0.0)
        }
    }
}
