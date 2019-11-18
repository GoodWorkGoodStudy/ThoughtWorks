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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI();
        requestData();
    }
    
    
    func requestData(){
        NTNetworkProvider.request(.getUserInfomation) { (result) in
            switch result{
            case let .success(response):
                print(response);
                do{
                    let jsonString = try response.mapString();
                    if let userModel = NTUserModel.deserialize(from: jsonString){
                        print(userModel);
                    }
                }catch{
                }
            case let .failure(error):
                print(error);
            }
        }
        
        
        NTNetworkProvider.request(.getUserTweets) { (result) in
            switch result{
            case let .success(response):
                print(response);
                do{
                    let jsonString = try response.mapString();
                    if let commentModels = [NTCommentModel].deserialize(from: jsonString) {
                        print(commentModels[4]?.images?.first?.url ?? "");
                        print(commentModels.first??.sender?.nick ?? "");
                        print(commentModels.first??.comments?.first?.sender?.nick ?? "");
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
            make.edges.equalTo(self.view);
        }
    }

}

extension NTHomeVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120*kScaleX;
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
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NTHomeListCell.className(), for: indexPath);
        return cell;
    }
    
}




