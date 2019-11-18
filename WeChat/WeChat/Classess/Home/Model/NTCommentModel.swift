//
//  NTCommentModel.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/18.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import HandyJSON


class NTCommentModel: HandyJSON {
    
    var content: String?
    var images: [ImagesModel]?
    var sender: SenderModel?
    var comments: [CommentsModel]?
    

    required init() {}
}


class ImagesModel: HandyJSON {
    
    var url: String?
    
    required init() {}
}


class SenderModel: HandyJSON {
    
    var username: String?
    var nick: String?
    var avatar: String?

    required init() {}
}

class CommentsModel: HandyJSON {
    
    var content: String?
    var sender: SenderModel?

    required init() {}
}






