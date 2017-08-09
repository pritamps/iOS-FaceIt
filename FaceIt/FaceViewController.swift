//
//  FaceViewController.swift
//  FaceIt
//
//  Created by Pritam Sukumar on 23/07/17.
//  Copyright © 2017 Pritam Sukumar. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            
            // Pinch handler
            let handler = #selector(FaceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            
            // Tap handler
            let tapRecognizer = UITapGestureRecognizer( target: self, action: #selector(toggleEyes(byReactingTo:)) )
            tapRecognizer.numberOfTapsRequired = 1
            faceView.addGestureRecognizer(tapRecognizer)
            
            // Swipe Up handler
            let swipeUpRecognizer = UISwipeGestureRecognizer( target: self, action: #selector(increaseHappiness))
            swipeUpRecognizer.direction = .up
            faceView.addGestureRecognizer(swipeUpRecognizer)
            
            // Swipe Down handler
            let swipeDownRecognizer = UISwipeGestureRecognizer( target: self, action: #selector(decreaseHappiness))
            swipeDownRecognizer.direction = .down
            faceView.addGestureRecognizer(swipeDownRecognizer)
            
            updateUI()
            
        }
    }
    
    func increaseHappiness() {
        expression = expression.happier
    }
    
    func decreaseHappiness() {
        expression = expression.sadder
    }
    func toggleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            expression = FacialExpression(eyes: (expression.eyes == .closed) ? .open : .closed, mouth: expression.mouth )
        }
    }
    
    var expression: FacialExpression = FacialExpression(eyes: .open, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        switch expression.eyes {
        case .open:
            faceView?.eyesOpen = true
        case .closed:
            faceView?.eyesOpen = false
        case.squinting:
            faceView?.eyesOpen = false
        }
        faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.grin: 0.5,
                           .frown: -1.0,
                           .smile: 1.0,
                           .smirk: -0.5,
                           .neutral: 0.0
                            ]
}

