//
//  DropItViewController.swift
//  DropIt
//
//  Created by Pete Bounford on 03/03/2017.
//  Copyright © 2017 PBO Apps. All rights reserved.
//

import UIKit

class DropItViewController: UIViewController {

    @IBOutlet weak var gameView: DropItView! {
        didSet {
            gameView.addGestureRecognizer(
                UITapGestureRecognizer(
                    target: self,
                    action: #selector(addDrop(_:))
                )
            )
        }
    }
    
    func addDrop(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            gameView.addDrop()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameView.animating = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameView.animating = false
    }
    
}
