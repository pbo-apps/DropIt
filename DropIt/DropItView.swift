//
//  DropItView.swift
//  DropIt
//
//  Created by Pete Bounford on 03/03/2017.
//  Copyright © 2017 PBO Apps. All rights reserved.
//

import UIKit

class DropItView: UIView {

    private let gravity = UIGravityBehavior()
    
    // Initialise the collider using a closure to allow us to configure it with a boundary
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    
    var animating = false {
        didSet {
            if animating {
                animator.addBehavior(gravity)
                animator.addBehavior(collider)
            } else {
                animator.removeBehavior(gravity)
                animator.removeBehavior(collider)
            }
        }
    }
    
    private let dropsPerRow = 10
    
    private var dropSize: CGSize {
        let size = bounds.size.width / CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    func addDrop() {
        var frame = CGRect(origin: CGPoint.zero, size: dropSize)
        frame.origin.x = CGFloat.random(max: dropsPerRow) * dropSize.width
    
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        
        addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
    } 
    
}
