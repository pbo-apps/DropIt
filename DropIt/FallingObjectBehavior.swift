//
//  FallingObjectBehavior.swift
//  DropIt
//
//  Created by Pete Bounford on 03/03/2017.
//  Copyright © 2017 PBO Apps. All rights reserved.
//

import UIKit

class FallingObjectBehavior: UIDynamicBehavior {
    
    private let gravity = UIGravityBehavior()
    
    // Initialise the collider using a closure to allow us to configure it with a boundary
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
    }

    func addItem(_ item: UIDynamicItem) {
        gravity.addItem(item)
        collider.addItem(item)
    }
    
    func removeItem(_ item: UIDynamicItem) {
        gravity.addItem(item)
        collider.addItem(item)
    }
    

}
