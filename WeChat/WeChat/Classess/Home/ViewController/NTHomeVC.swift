//
//  NTHomeVC.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/16.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import SnapKit

class NTHomeVC: NTBaseViewController,UITableViewDelegate,UITableViewDataSource {

    
    var listView: UITableView!
    
    //MARK: - ♻️life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI();
        
    }
    
    //MARK: - 🔄overwrite
    
    //MARK: - 🚪public
    
    //MARK: - 🍐delegate
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120*kScaleX;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
    }
    
    //MARK: - ☎️notification
    
    //MARK: - 🎬event response
    
    //MARK: - 🔒private
    
    //MARK: - 🌲setupUI
    
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
    
    //MARK: - ☸getter and setter

}
