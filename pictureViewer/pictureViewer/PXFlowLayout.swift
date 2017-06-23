//
//  PXFlowLayout.swift
//  pictureViewer
//
//  Created by 潘鑫 on 2017/6/23.
//  Copyright © 2017年 潘鑫. All rights reserved.
//

import UIKit


class PXFlowLayout: UICollectionViewFlowLayout {

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
    
    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        
//       let currentItemAttributes = super.layoutAttributesForItem(at: indexPath)
//        
//    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let array = super.layoutAttributesForElements(in: rect)
        //可视rect
        var visibleRect = CGRect()
        visibleRect.origin = self.collectionView!.contentOffset
        visibleRect.size = self.collectionView!.bounds.size
        
        
        
        for (index,attributes) in array!.enumerated(){
            //cell对屏幕中心的距离
            if index == 1 {
                print("visibleRect = \(visibleRect.midX)")
                print("attributes = \(attributes.center.x)")
            }
            
            let distance = attributes.center.x - visibleRect.midX
            
            if distance > 0  && distance < visibleRect.width && attributes.center.x != visibleRect.width{
                if index == 0 {
                    print("visibleRect 0 000 = \(visibleRect.midX)")
                    print("attributes  00000= \(attributes.center.x)")
                }
                
                //缩放比例
                let scling: CGFloat = self.collectionView!.contentOffset.x.truncatingRemainder(dividingBy: self.collectionView!.bounds.width) / collectionView!.bounds.width
                
                attributes.center = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                attributes.transform = attributes.transform.scaledBy(x: scling, y: scling)
                attributes.alpha = scling
            }
            
        }
        return array
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
