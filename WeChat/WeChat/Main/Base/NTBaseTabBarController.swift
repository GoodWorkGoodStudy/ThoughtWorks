//
//  NTBaseTabBarController.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/16.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit

class NTBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTabbar();
    }
    
    func setupTabbar(){
        
        let homeVC = NTHomeVC();
        let circleVC = NTCircleVC();
        let userVC = NTUserVC();
        
        addChildViewController(homeVC, title: "首页", image: "tab_account", selectedImage: "tab_account_sel", tag: 1000);
        addChildViewController(circleVC, title: "圈子", image: "tab_shop", selectedImage: "tab_shop_sel", tag: 1001);
        addChildViewController(userVC, title: "我的", image: "tab_me", selectedImage: "tab_me_sel", tag: 1002);
        
    }
    
    func addChildViewController(_ childVC: UIViewController, title: String, image: String, selectedImage: String, tag: NSInteger){
        
        childVC.title = title;
        childVC.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal);
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal);
        childVC.tabBarItem.tag = tag;
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kTabNormalColor], for: .normal);
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kTabSelectedColor], for: .selected);
        
        let navVC = NTBaseNavigationController.init(rootViewController: childVC);
        self.addChild(navVC);
        
    }

}



