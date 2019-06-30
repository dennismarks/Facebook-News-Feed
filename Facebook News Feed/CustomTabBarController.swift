//
//  CustomTabBarController.swift
//  Facebook News Feed
//
//  Created by Dennis M on 2019-09-09.
//  Copyright © 2019 Dennis M. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        
        viewControllers = [navigationController]
    }
    
}
