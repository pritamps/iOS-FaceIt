//
//  SplitViewController.swift
//  FaceIt
//
//  Created by Pritam Sukumar on 27/07/17.
//  Copyright © 2017 Pritam Sukumar. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    // Make sure the view opens with the Master of the SplitView in iPhone etc.
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
