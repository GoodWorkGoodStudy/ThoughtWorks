//
//  NTHomeListCell.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/16.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class NTHomeListCell: UITableViewCell {

    var iconImageView: UIImageView?
    var nameLabel: UILabel?
    var contentLabel: UILabel?
    var imageListView: NTImageListView?
    var commentView: UIView?
    
    
    
    

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
        
        var rowHeight: CGFloat;
        
        
        let iconUrl = URL.init(string: commentModel.sender?.avatar ?? "");
        self.iconImageView?.kf.setImage(with: iconUrl);
        self.nameLabel?.text = commentModel.sender?.username;
        self.contentLabel?.text = commentModel.content;
        imageListView?.fillViewWithCommentModel(commentModel: commentModel);
        
  
        
        let margin = 10*kScaleX;
        
        
        iconImageView?.frame = CGRect(x: margin, y: margin, width: 50*kScaleX, height: 50*kScaleX);
        
        let nameLabelW = kScreenWidth - 3*margin - 50*kScaleX;
        nameLabel?.frame = CGRect(x: 2*margin + 50*kScaleX, y: margin, width: nameLabelW, height: 20*kScaleX);
        
        let contentSize = contentLabel?.sizeThatFits(CGSize(width: nameLabelW, height: 10000000.0));
        contentLabel?.frame = CGRect(x: 2*margin + 50*kScaleX, y: nameLabel!.bottom + margin, width: contentSize!.width, height: contentSize!.height);
        
        if commentModel.images?.count ?? 0 > 0{
            // 有图片
            imageListView?.origin = CGPoint(x: 2*margin + 50*kScaleX, y: contentLabel!.bottom);
        }
        
        commentView?.frame = CGRect(x: 2*margin + 50*kScaleX, y: imageListView?.bottom ?? 0, width: nameLabelW, height: 0*kScaleX);
        
        
        
        rowHeight = max(commentView?.bottom ?? 0, margin * 2 + 50*kScaleX);
        commentModel.rowHeight = rowHeight;
        print(rowHeight)
   
        
        
    }
    
    
    

    private func setupUI(){
        
        iconImageView = UIImageView();
        iconImageView?.backgroundColor = UIColor.lightGray;
        iconImageView?.layer.cornerRadius = 5*kScaleX;
        iconImageView?.clipsToBounds = true;
        
        let lineView: UIView = UIView();
        lineView.backgroundColor = kLineColor;
        
        nameLabel = UILabel();
        nameLabel?.text = "******";
        nameLabel?.textColor = kTextBlackColor;
        nameLabel?.font = UIFont.boldSystemFont(ofSize: 18*kScaleX);
        nameLabel?.textAlignment = .left;
        nameLabel?.numberOfLines = 2;
        
        contentLabel = UILabel();
        contentLabel?.text = "======";
        contentLabel?.numberOfLines = 0;
        contentLabel?.sizeToFit();
        contentLabel?.textColor = kTextBlackColor;
        contentLabel?.font = UIFont.systemFont(ofSize: 16*kScaleX);
        contentLabel?.textAlignment = .left;
        
        imageListView = NTImageListView();
        
        commentView = UIView();
        
        
        
        
        self.addSubview(iconImageView!);
        self.addSubview(lineView);
        self.addSubview(nameLabel!);
        self.addSubview(contentLabel!);
        self.addSubview(imageListView!);
        self.addSubview(commentView!);
        
        
    }
    

}



//        iconImageView?.snp.makeConstraints({ (make) in
//            make.left.top.equalTo(self).offset(10*kScaleX);
//            make.width.height.equalTo(50*kScaleX);
//        })
//
//        lineView.snp.makeConstraints { (make) in
//            make.left.equalTo(iconImageView!);
//            make.right.equalTo(self).offset(-10*kScaleX);
//            make.bottom.equalTo(self);
//            make.height.equalTo(1);
//        }
//
//        nameLabel?.snp.makeConstraints({ (make) in
//            make.top.equalTo(iconImageView!);
//            make.right.equalTo(lineView);
//            make.left.equalTo(iconImageView!.snp.right).offset(10*kScaleX);
//        })
//
//        contentLabel?.snp.makeConstraints({ (make) in
//            make.left.equalTo(iconImageView!.snp.right).offset(10*kScaleX);
//            make.right.equalTo(self).offset(-10*kScaleX);
//            make.top.equalTo(nameLabel!.snp.bottom);
//        })
