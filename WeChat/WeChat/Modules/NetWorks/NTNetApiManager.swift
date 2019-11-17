//
//  NTNetApiManager.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/17.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import Foundation
import Moya


let NTNetworkProvider = MoyaProvider<NTNetApiManager>()


enum NTNetApiManager {
    case getUserInfomation
    case getUserTweets
}


extension NTNetApiManager: TargetType{

    var baseURL: URL {
        return URL.init(string: "https://thoughtworks-mobile-2018.herokuapp.com")!;
    }
    
    var path: String {
        switch self {
        case .getUserInfomation:
            return "/user/jsmith";
        case .getUserTweets:
            return "/user/jsmith/tweets";
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserInfomation:
            return .get
        case .getUserTweets:
            return .get
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!;
    }
    
    var task: Task {
        var params:[String : Any] = [:]
        params["version"] = "1.0.0";
        
        switch self {
        case .getUserInfomation:
            break;
        case .getUserTweets:
            break;
        }
        
        return .requestParameters(parameters: params, encoding: URLEncoding.default);
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"];
    }

    
}






