//
//  NTHomeListCell.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/16.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import SnapKit

class NTHomeListCell: UITableViewCell {

    var iconImageView: UIImageView?
    var nameLabel: UILabel?
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        selectionStyle = .none;
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    
    
    // 填充数据
    public func fillCellWithCommentModel(commentModel: NTCommentModel){
        print(commentModel.content ?? "");
    }
    
    
    

    func setupUI(){
        
        iconImageView = UIImageView();
        iconImageView?.backgroundColor = UIColor.lightGray;
        iconImageView?.layer.cornerRadius = 5*kScaleX;
        iconImageView?.clipsToBounds = true;
        
        let lineView: UIView = UIView();
        lineView.backgroundColor = kLineColor;
        
        nameLabel = UILabel();
        nameLabel?.text = "66666666";
        nameLabel?.textColor = kTextBlackColor;
        nameLabel?.font = UIFont.boldSystemFont(ofSize: 18*kScaleX);
        nameLabel?.textAlignment = .left;
        nameLabel?.numberOfLines = 2;
        
        
        
        
        self.addSubview(iconImageView!);
        self.addSubview(lineView);
        self.addSubview(nameLabel!);
        
        
        iconImageView?.snp.makeConstraints({ (make) in
            make.left.top.equalTo(self).offset(10*kScaleX);
            make.width.height.equalTo(100*kScaleX);
        })
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView!);
            make.right.equalTo(self).offset(-10*kScaleX);
            make.bottom.equalTo(self);
            make.height.equalTo(1);
        }
        
        nameLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(iconImageView!);
            make.right.equalTo(lineView);
            make.left.equalTo(iconImageView!.snp.right).offset(10*kScaleX);
        })
        
        
        
    }
    
    
    
    

}
