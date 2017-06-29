//
//  CLRankController.swift
//  CatLive
//
//  Created by qianjn on 2017/6/6.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

class CLRankController: XCViewController, Emitterable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startEmitter()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        startEmitter()
    }
    
}
