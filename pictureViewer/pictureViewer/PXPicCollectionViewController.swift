//
//  PXPicCollectionViewController.swift
//  pictureViewer
//
//  Created by 潘鑫 on 2017/6/23.
//  Copyright © 2017年 潘鑫. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PXPicViewer"

class PXPicCollectionViewController: UICollectionViewController {
    //图片数组
    var picArr: [String] = []
    //返回按钮
    let backBtn: UIButton = {
        
        let backBtn = UIButton(frame: CGRect(x: 10, y: 15, width: 35, height: 35))
        backBtn.setImage(UIImage(named: "back.png"), for: .normal)
        backBtn.addTarget(self, action:#selector(backVC), for: .touchUpInside)
        return backBtn
        
    }()
    
    
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    //便利构造函数
    convenience init(picArr: [String]) {
        let layout = PXFlowLayout()
        
        self.init(collectionViewLayout: layout)
        
        self.picArr = picArr
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        collectionView?.register(UINib.init(nibName: "PXPicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.scrollsToTop = false
        collectionView?.isPagingEnabled = true
        //不自动调整位置
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.addSubview(backBtn)
    }
    
   
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return picArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PXPicCollectionViewCell
    
        cell.picView.image = UIImage(named: picArr[indexPath.row])
    
        return cell
    }

    @objc private func backVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
