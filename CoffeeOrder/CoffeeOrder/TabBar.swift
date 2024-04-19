//
//  TabBar.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 16.12.2023.
//

import UIKit
import SnapKit

class TabBar: UITabBarController {
    
    
    let marketTab = UINavigationController(rootViewController: MarketView())
    let cartTab = UINavigationController(rootViewController: cartView())
    let bookmarkTab = UINavigationController(rootViewController: BookMark())
    let natTab = UINavigationController(rootViewController: natificationView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabSettings()
        setupTabs()
        viewControllers = [marketTab,bookmarkTab,cartTab,natTab]
    }
    
    
    private func setupTabSettings(){
        self.tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 16
        view.backgroundColor = .white
        self.tabBar.tintColor = UIColor(named: "coffee")
        
    }
    
    private func setupTabs(){
        marketTab.navigationBar.contentMode = .center
        marketTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.circle"), tag: 0)
        cartTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bag"), tag: 3)
        bookmarkTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart.circle"), tag: 2)
        natTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bell.badge.circle"), tag: 1)

    }
}


