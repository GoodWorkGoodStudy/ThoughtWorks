//
//  NTImageListView.swift
//  WeChat
//
//  Created by 于洪东 on 2019/11/19.
//  Copyright © 2019 WeChat. All rights reserved.
//

import UIKit

class NTImageListView: UIView {
    
    var imageViewsArray: NSMutableArray?

    override init(frame: CGRect) {
        super.init(frame: frame);
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fillViewWithCommentModel(commentModel: NTCommentModel){
        
        for item in imageViewsArray!{
            let imageView = item as! NTImageView;
            imageView.isHidden = true;
        }
        
        let imageCount = commentModel.images?.count ?? 0;
        if imageCount <= 0 {
            self.size = CGSize.zero;
            return;
        }
        
        var lastImageView: NTImageView?
        
        for index in 0..<imageCount {
            var rowNum = index / 3;
            var colNum = index % 3;
            
            if imageCount == 4 {
                rowNum = index / 2;
                colNum = index % 2;
            }
            
            let imageWidth = 75*kScaleX;
            let imagePadding = 5*kScaleX;
            
            let imageX = CGFloat(colNum) * (imageWidth + imagePadding);
            let imageY = CGFloat(rowNum) * (imageWidth + imagePadding);
            let frame = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageWidth);
            
            lastImageView = self.viewWithTag(1000+index) as? NTImageView;
            lastImageView?.isHidden = false;
            lastImageView?.frame = frame;
            let iconUrl = URL.init(string: commentModel.images?[index].url ?? "");
            lastImageView?.kf.setImage(with: iconUrl)
        }
        
        self.width = kScreenWidth - 20*kScaleX - 50*kScaleX;
        self.height = lastImageView!.bottom;
    }
    
    
    private func setupUI() {
        
        imageViewsArray = NSMutableArray.init();
        
        for index in 0..<9 {
            let imageView = NTImageView.init(frame: CGRect.zero);
            imageView.tag = index + 1000;
            imageView.backgroundColor = UIColor.lightGray;
            imageViewsArray?.add(imageView);
            self.addSubview(imageView);
        }
        
        
    }

}



class NTImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.lightGray
        self.contentScaleFactor = UIScreen.main.scale;
        self.contentMode = .scaleAspectFill;
        self.clipsToBounds  = true;
    }
    
}

