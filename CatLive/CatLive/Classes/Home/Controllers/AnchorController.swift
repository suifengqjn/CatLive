//
//  AnchorController.swift
//  CatLive
//
//  Created by qianjn on 2017/6/11.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 8
private let kAnchorCellID = "kAnchorCellID"


class AnchorController: XCViewController {

    // MARK: 对外属性
    var homeType : HomeType!
    
    lazy var collectionView: UICollectionView = {
       
        let layout = CLWaterFallLayout()
        layout.dataSource = self;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        let frame = CGRect(x: 0, y: 100, width: kScreenW, height: kScreenH - 200)
        let collec = UICollectionView(frame: frame, collectionViewLayout: layout)
        collec.dataSource = self
        return collec
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
}


// MARK:- 设置UI界面内容
extension AnchorController {
    fileprivate func setupUI() {
        collectionView .register(UICollectionViewCell.self, forCellWithReuseIdentifier: kAnchorCellID)
        view.addSubview(collectionView)
    }
}

// MARK:- collectionView的数据源&代理
extension AnchorController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAnchorCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        
        return cell
        
    }
}

// MARK: CLWaterFallLayoutDataSouse
extension AnchorController: CLWaterFallLayoutDataSouce {
    
    func numberOfCloums(_waterFall: CLWaterFallLayout) -> Int {
        return 3
    }
    
    func waterFall(_ waterFall: CLWaterFallLayout, item: Int) -> CGFloat {
        return CGFloat(arc4random_uniform(100)) + 50.0
    }
}



