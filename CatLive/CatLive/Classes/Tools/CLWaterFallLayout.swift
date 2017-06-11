//
//  CLWaterFallLayout.swift
//  CatLive
//
//  Created by qianjn on 2017/6/11.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

// 数据源
protocol CLWaterFallLayoutDataSouce: class {
    func numberOfCloums(_waterFall: CLWaterFallLayout) -> Int
    func waterFall(_ waterFall: CLWaterFallLayout, item: Int) -> CGFloat
}

class CLWaterFallLayout: UICollectionViewFlowLayout {

    weak var dataSource: CLWaterFallLayoutDataSouce?
    
    //每个 cell 布局属性的数组
    fileprivate lazy var cellAttr: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    
    // 有多少列
    fileprivate lazy var cloums: Int = {
       
        return self.dataSource?.numberOfCloums(_waterFall: self) ?? 3
        
    }()
    
    fileprivate lazy var totalHeights: [CGFloat] = Array(repeating: self.sectionInset.top, count: self.cloums)
}


// MARK: 第一步：准备布局
extension CLWaterFallLayout {
    
    override func prepare() {
        
        // 1. 获取item个数(这里只考虑瀑布流只有一组的情况)
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        
        let cellWidth = (collectionView!.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing * CGFloat(cloums - 1)) / CGFloat(cloums)
        // 2. 给每个Cell 创建一个 UICollectionViewLayoutAttributes
        for i in cellAttr.count..<itemCount {
            
            let indexPath = IndexPath(item: i, section: 0)
            let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // 取出当前所有高度中的最小值
            let minHeight = totalHeights.min()!
            // 最小值所在的列数
            let minIndex = totalHeights.index(of: minHeight)!
            
            let cellX: CGFloat = sectionInset.left + (minimumInteritemSpacing + cellWidth) * CGFloat(minIndex)
            var cellY: CGFloat = 0.0
            if cellAttr.count <= cloums {
                cellY = CGFloat(sectionInset.top + minimumLineSpacing + minHeight)
            } else {
                cellY = CGFloat(sectionInset.top + minimumLineSpacing + minHeight)
            }
            
            guard let cellHight = self.dataSource?.waterFall(self, item: i) else {
                fatalError("必须实现数据源方法，并返回高度")
            }
           
            attr.frame = CGRect(x: cellX, y: cellY, width: cellWidth, height: cellHight)
            
            // 保存
            cellAttr.append(attr)
            
            //添加当前高度
            totalHeights[minIndex] = minHeight + minimumLineSpacing + cellHight
            
        }
        
    }
}

// MARK: 第二步：返回所有的布局结果
extension CLWaterFallLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cellAttr
    }
}


// MARK: 第三步：重新设置contentSize
extension CLWaterFallLayout {
 
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 0, height: totalHeights.max()! + sectionInset.bottom)
    }
}
