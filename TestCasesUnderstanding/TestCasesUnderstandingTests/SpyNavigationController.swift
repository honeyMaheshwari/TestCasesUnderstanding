//
//  SpyNavigationController.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 09/07/24.
//

import UIKit

class SpyNavigationController: UINavigationController {

    var pushedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }

}
