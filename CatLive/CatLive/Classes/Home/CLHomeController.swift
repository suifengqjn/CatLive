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
        setupContentView()
    }

    
    
    
    

}


// MARK: UI
extension CLHomeController {
    
    fileprivate func buildUI() {
        buildNavbar()
    }
    
    // 布局导航条
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
    
    // 布局内容视图
    fileprivate func setupContentView() {
        // 1.获取数据
        let homeTypes = loadTypesData()
        
        // 2.创建主题内容
        let style = CLTitleStyle()
        style.isScrollEnable = true
        style.isShowBottomLine = true
        let pageFrame = CGRect(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: kScreenH - kNavigationBarH - kStatusBarH - 44)
        
        let titles = homeTypes.map({ $0.title })
        var childVcs = [AnchorController]()
        for type in homeTypes {
            let anchorVc = AnchorController()
            anchorVc.homeType = type
            anchorVc.collectionView.frame = CGRect(x: 0, y: pageFrame.origin.y, width: kScreenW, height: kScreenH -  pageFrame.origin.y - 49)
            
            childVcs.append(anchorVc)
        }
        let pageView = CLPageView(frame: pageFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        view.addSubview(pageView)
    }
    
    fileprivate func loadTypesData() -> [HomeType] {
        let path = Bundle.main.path(forResource: "types.plist", ofType: nil)!
        let dataArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        var tempArray = [HomeType]()
        for dict in dataArray {
            tempArray.append(HomeType(dict: dict))
        }
        return tempArray
    }
}

// MARK: action
extension CLHomeController {
    
    @objc fileprivate func followItemClick () {
        
    }
}
