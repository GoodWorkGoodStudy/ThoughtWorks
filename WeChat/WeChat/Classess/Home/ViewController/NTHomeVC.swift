//
//  NTHomeVC.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/16.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import SnapKit
import Moya
import HandyJSON

class NTHomeVC: NTBaseViewController {

    var listView: UITableView!
    var listArray: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.listArray = NSMutableArray.init();
        
        setupUI();
        requestData();
    }
    
    
    func requestData(){
//        NTNetworkProvider.request(.getUserInfomation) { (result) in
//            switch result{
//            case let .success(response):
//                print(response);
//                do{
//                    let jsonString = try response.mapString();
//                    if let userModel = NTUserModel.deserialize(from: jsonString){
//                        print(userModel);
//                    }
//                }catch{
//                }
//            case let .failure(error):
//                print(error);
//            }
//        }
        
        
        NTNetworkProvider.request(.getUserTweets) { (result) in
            switch result{
            case let .success(response):
                print(response);
                do{
                    let jsonString = try response.mapString();
                    if let commentModels = [NTCommentModel].deserialize(from: jsonString) {
                        let tempArray = NSMutableArray.init(array: commentModels as [Any]);
                        for item in tempArray{
                            let commentModel = item as! NTCommentModel;
                            if commentModel.content != nil || commentModel.images?.count ?? 0 > 0{
                                self.listArray.add(commentModel);
                            }
                        }
                        self.listView.reloadData();
                    }
                }catch{
                }
            case let .failure(error):
                print(error);
            }
        }
        
    }
    
    
    func setupUI(){
        
        listView = UITableView.init(frame: CGRect.zero, style: .plain);
        listView.backgroundColor = UIColor.white;
        listView.delegate = self;
        listView.dataSource = self;
        listView.tableFooterView = UIView();
        listView.separatorStyle = .none;
        listView.register(NTHomeListCell.self, forCellReuseIdentifier: NTHomeListCell.className());
        
        
        self.view.addSubview(listView);
        
        
        listView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.view).offset(kNavigationBarHeight);
            make.bottom.equalTo(self.view).offset(-kTabbarHeight);
        }
    }

}

extension NTHomeVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let commentModel = self.listArray[indexPath.row] as! NTCommentModel;
        return commentModel.rowHeight ?? 0.00;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
    }
}

extension NTHomeVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NTHomeListCell.className(), for: indexPath) as! NTHomeListCell;
        cell.fillCellWithCommentModel(commentModel: self.listArray?[indexPath.row] as! NTCommentModel);
        return cell;
    }
    
}




