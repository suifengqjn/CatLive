//
//  Emitterable.swift
//  CatLive
//
//  Created by qianjn on 2017/6/29.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit

//面向协议开发，类似于多继承，遵守某个协议，就拥有协议中的方法

protocol Emitterable {
    
}

// 对协议进行约束， 只有是UIViewController 的子类 才能 遵守这个协议
extension Emitterable where Self: UIViewController {
    func startEmitter() {
        // 1.创建发射器
        let emitter = CAEmitterLayer()
        
        // 2.设置发射器的位置
        emitter.emitterPosition = CGPoint(x: view.bounds.width  - 50, y: view.bounds.height - 60)
        
        // 3.开启三维效果
        emitter.preservesDepth = true
        
        // 4.创建例子, 并且设置例子相关的属性
        // 4.1.创建例子Cell
        let cell = CAEmitterCell()
        
        // 4.2.设置粒子速度
        cell.velocity = 150
        cell.velocityRange = 100
        
        // 4.3.设置例子的大小
        cell.scale = 0.7
        cell.scaleRange = 0.3
        
        // 4.4.设置粒子方向
        cell.emissionLongitude = CGFloat(-Double.pi / 2)
        cell.emissionRange = CGFloat(Double.pi / 2 / 6)

        
        // 4.5.设置例子的存活时间
        cell.lifetime = 6
        cell.lifetimeRange = 1.5
        
        // 4.6.设置粒子旋转
        cell.spin = CGFloat(Double.pi / 2)
        cell.spinRange = CGFloat(Double.pi / 2 / 2)
        
        // 4.6.设置例子每秒弹出的个数
        cell.birthRate = 20
        
        // 4.7.设置粒子展示的图片
        cell.contents = UIImage(named: "good6_30x30")?.cgImage
        
        // 5.将粒子设置到发射器中
        emitter.emitterCells = [cell]
        
        // 6.将发射器的layer添加到父layer中
        view.layer.addSublayer(emitter)
    }
    
    
    func stopEmittering() {
        /*
         for layer in view.layer.sublayers! {
         if layer.isKind(of: CAEmitterLayer.self) {
         layer.removeFromSuperlayer()
         }
         }
         */
        view.layer.sublayers?.filter({ $0.isKind(of: CAEmitterLayer.self)}).first?.removeFromSuperlayer()
    }
}
