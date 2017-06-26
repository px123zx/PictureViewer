//
//  PXFlowLayout.swift
//  pictureViewer
//
//  Created by 潘鑫 on 2017/6/23.
//  Copyright © 2017年 潘鑫. All rights reserved.
//

import UIKit


class PXFlowLayout: UICollectionViewFlowLayout {

    //保存前一次偏移量,用于判断滑动方向
    var oldOffsetX: CGFloat = 0
    //记录上一次右滑是否完成，用于处理在右滑一半在左滑的情况
    var lastRight: Bool = true
    
    
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let array = NSArray(array: super.layoutAttributesForElements(in: rect)!, copyItems:true) as! [UICollectionViewLayoutAttributes]
        //可视rect
        var visibleRect = CGRect()
        visibleRect.origin = self.collectionView!.contentOffset
        visibleRect.size = self.collectionView!.bounds.size
        
        //是否右滑
        let isRight = self.collectionView!.contentOffset.x - oldOffsetX < 0 ? true : false
        //缩放比例
        var scling: CGFloat = self.collectionView!.contentOffset.x.truncatingRemainder(dividingBy: self.collectionView!.bounds.width) / collectionView!.bounds.width
        
        for (index,attributes) in array.enumerated(){
            //cell对屏幕中心的距离
            let distance = attributes.center.x - visibleRect.midX
            
            if distance > 0  && distance <= visibleRect.width && index != 0{
                //右滑动 || 右滑未完成
                if (isRight && scling <= 0.8) || (!lastRight && scling <= 0.8){
                    scling = 0.8
                    lastRight = false
                }
                
                //右滑完成
                if distance == visibleRect.width {
                    lastRight = true
                }
                
                
                attributes.center = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                attributes.transform = attributes.transform.scaledBy(x: scling, y: scling)
                attributes.alpha = scling
                //调整层级关系
                attributes.zIndex = -1
                
                break
            }
           
        }
        oldOffsetX = self.collectionView!.contentOffset.x
        return array
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
