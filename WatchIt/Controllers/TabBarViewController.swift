//
//  TabViewController.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/3/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }
    
    private func setupController() {
        let home = HomeViewController()
        let explore = ExploreViewController()
        let profile = ProfileViewController()
        
        home.title = "Home"
        explore.title = "Explore"
        profile.title = "Profile"
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: explore)
        let nav3 = UINavigationController(rootViewController: profile)
        
        nav1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass.circle"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 3)
        setViewControllers([nav1,nav2,nav3], animated: false)
    }
    
    // MARK: - TabBar

}
