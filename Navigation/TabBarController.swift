//
//  TabBarController.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/24/21.
//
import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var homeItemImageView: UIImageView!
    var historyItemImageView: UIImageView!
    var newBoxItemImageView: UIImageView!
    var profileItemImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        setupTabBarControllers()
        setTabBarImages()
        // Do any additional setup after loading the view.
    }
    
    func setTabBarImages() {
        
        let homeItemView = self.tabBar.subviews[0]
        let historyItemView = self.tabBar.subviews[1]
        let newBoxItemView = self.tabBar.subviews[2]
        let profileItemView = self.tabBar.subviews[3]
        
        self.homeItemImageView = (homeItemView.subviews.first as! UIImageView)
        self.homeItemImageView.contentMode = .center
        
        self.historyItemImageView = (historyItemView.subviews.first as! UIImageView)
        self.historyItemImageView.contentMode = .center
        
        self.newBoxItemImageView = (newBoxItemView.subviews.first as! UIImageView)
        self.newBoxItemImageView.contentMode = .center
        
        self.profileItemImageView = (profileItemView.subviews.first as! UIImageView)
        self.profileItemImageView.contentMode = .center
    }

    func setupTabBarControllers() {
        let homeVC = HomeVC()
        let nav1 = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        let newBoxVC = NewBoxController()
        let nav2 = UINavigationController(rootViewController: newBoxVC)
        newBoxVC.tabBarItem = UITabBarItem(title: "New", image: UIImage(named: "box"), tag: 1)
        
        let HistoryVC = historyVC()
        let nav3 = UINavigationController(rootViewController: HistoryVC)
        HistoryVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "previous"), tag: 2)
        
        let profileVC = ProfileViewController()
        let nav4 = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "profile", image: UIImage(named: "profile"), tag: 3)
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
    }

}
