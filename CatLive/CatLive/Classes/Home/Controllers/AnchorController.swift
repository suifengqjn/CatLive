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
    // MARK: 定义属性
    fileprivate lazy var homeVM : HomeViewModel = HomeViewModel()
    lazy var collectionView: UICollectionView = {
       
        let layout = CLWaterFallLayout()
        layout.dataSource = self;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        let frame = self.view.bounds
        let collec = UICollectionView(frame: frame, collectionViewLayout: layout)
        collec.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collec.dataSource = self
        collec.delegate = self as? UICollectionViewDelegate
        collec.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: kAnchorCellID)
        collec.backgroundColor = UIColor.white
        return collec
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData(index: 0)
    }
    
    
}


// MARK:- 设置UI界面内容
extension AnchorController {
    fileprivate func setupUI() {
        
        view.addSubview(collectionView)
        
    }
}

extension AnchorController {
    fileprivate func loadData(index : Int) {
        homeVM.loadHomeData(type: homeType, index : index, finishedCallback: {
            self.collectionView.reloadData()
        })
    }
}

// MARK:- collectionView的数据源&代理
extension AnchorController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
        //return homeVM.anchorModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAnchorCellID, for: indexPath) as! HomeViewCell
        
//        cell.anchorModel = homeVM.anchorModels[indexPath.item]
//        
//        if indexPath.item == homeVM.anchorModels.count - 1 {
//            loadData(index: homeVM.anchorModels.count)
//        }
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
        
    }
}

// MARK: CLWaterFallLayoutDataSouse
extension AnchorController: CLWaterFallLayoutDataSouce {
    
    func numberOfCloums(_waterFall: CLWaterFallLayout) -> Int {
        return 2
    }
    
    func waterFall(_ waterFall: CLWaterFallLayout, item: Int) -> CGFloat {
        return item % 2 == 0 ? kScreenW * 2 / 3 : kScreenW * 0.5
    }
}



