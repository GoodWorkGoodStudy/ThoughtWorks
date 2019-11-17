//
//  NTUserModel.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/17.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import HandyJSON

class NTUserModel: HandyJSON {
    
    var avatar: String?
    var nick: String?
    var profileImage: String?
    var username: String?

    required init() {}
    
    func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.profileImage <-- "profile-image";
    }
    
}
