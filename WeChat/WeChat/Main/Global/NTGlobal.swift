//
//  NTGlobal.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/16.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import YYCategories


class NTGlobal: NSObject {
}


var kIsIphoneX: Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
            return false
        }
        
        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
            print(unwrapedWindow.safeAreaInsets)
            return true
        }
    }
    return false
}


/// 颜色
let kMainColor = UIColor.init(hexString: "#4690FD")!
let kTabNormalColor = UIColor.init(hexString: "#929292")!
let kTabSelectedColor = UIColor.init(hexString: "#4A4AFF")!
let kLineColor = UIColor.init(hexString: "#DADFE6")!
let kBackGroundColor = UIColor.white
let kTextBlackColor = UIColor.black



/// 布局
let kScreenWidth = UIScreen.main.bounds.size.width;
let kScreenHeight = UIScreen.main.bounds.size.height;
let kScaleX = kScreenWidth / 375;
let kNavigationBarHeight = kIsIphoneX ? 88 : 64;
let kStatusBarHeight = kIsIphoneX ? 44 : 20;
let kTabbarHeight = kIsIphoneX ? 83 : 49;


