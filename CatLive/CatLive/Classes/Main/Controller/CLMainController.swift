//
//  CLMainController.swift
//  CatLive
//
//  Created by qianjn on 2017/6/6.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

class CLMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpChildVC()
        
    }

    
    func setUpChildVC() {
        
        addChildVC("CLHome")
        addChildVC("CLRank")
        addChildVC("CLDiscover")
        addChildVC("CLProfile")
        
    }
    
    fileprivate func addChildVC(_ stroryName: String) {
    
    let childVC = UIStoryboard(name: stroryName, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVC)
    
    }
    
    

    
}
