//
//  CLHomeController.swift
//  CatLive
//
//  Created by qianjn on 2017/6/6.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

class CLHomeController: XCViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        buildUI()
    }

    
    
    
    

}


// MARK: UI
extension CLHomeController {
    
    fileprivate func buildUI() {
        buildNavbar()
    }
    
    private func buildNavbar() {
        
        //1. 左侧logo
        let logoImage = UIImage(named: "home_logo")
        let letfbarItem = UIBarButtonItem(image: logoImage, style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = letfbarItem
        
        //2. 右侧item
        let collectImage = UIImage(named: "search_btn_follow")
        let rightbarItem = UIBarButtonItem(image: collectImage, style: .plain, target: self, action: #selector(followItemClick))
        navigationItem.rightBarButtonItem = rightbarItem
        // 事件监听 --> 发送消息 --> 将方法包装SEL  --> 类方法列表 --> IMP
        
        // 3.搜索框
        let searchbarFrame = CGRect(x: 0, y: 0, width: 320, height: 32);
        let searchBar = UISearchBar(frame: searchbarFrame)
        searchBar.placeholder = "主播昵称/房间号/链接"
        navigationItem.titleView = searchBar
        searchBar.searchBarStyle = .minimal
        let searchFiled = searchBar.value(forKey: "_searchField") as? UITextField
        searchFiled?.textColor = UIColor.white
    }
}

// MARK: action
extension CLHomeController {
    
    @objc fileprivate func followItemClick () {
        
    }
}
