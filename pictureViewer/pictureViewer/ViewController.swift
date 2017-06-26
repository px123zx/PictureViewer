//
//  ViewController.swift
//  pictureViewer
//
//  Created by 潘鑫 on 2017/6/23.
//  Copyright © 2017年 潘鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func pushToPicCollectVC(_ sender: Any) {
    
        let vc = PXPicCollectionViewController(picArr: ["1.jpeg","2.jpeg","3.jpeg","4.jpeg"])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

