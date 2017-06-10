//
//  UIColor+Extension.swift
//  CatLive
//
//  Created by qianjn on 2017/6/10.
//  Copyright © 2017年 SF. All rights reserved.
//

import UIKit


extension UIColor {
    // 不推荐使用类方法
//    class func colorWithRGB() {
//        
//    }
    
    //推荐使用构造函数，extension 中，只能添加便利构造函数
    //便利构造函数注意点
    // 1. convenience
    // 2.  self.init()
    convenience init(r: CGFloat, g: CGFloat, b:  CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    convenience init(hexValue: NSInteger, alpha: CGFloat = 1.0) {
        
        self.init(red: CGFloat((Float((hexValue & 0xFF0000) >> 16))/255.0),
                  green: CGFloat((Float((hexValue & 0xFF00) >> 8))/255.0),
                  blue: CGFloat((Float(hexValue & 0xFF))/255.0), alpha: alpha)
    }
    
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        
        //1.判断颜色字符串长度
        guard hexString.characters.count >= 6 else {
            return nil;
        }
        //2. 转换成大写
        var BhexString: NSString = hexString.uppercased() as NSString
        //3. 判断开头部分
        if (hexString.hasPrefix("0x") || hexString.hasPrefix("0X")){
            BhexString = BhexString.substring(from: 2) as NSString
        }
        if (hexString.hasPrefix("#")) {
            BhexString = BhexString.substring(from: 1) as NSString
        }
        
        
        var range = NSRange(location: 0, length: 2)
        let rrgb = BhexString.substring(with: range)
        
        range.location = 2
        let grgb = BhexString.substring(with: range)
        
        range.location = 4
        let brgb = BhexString.substring(with: range)
        
        //将16进制转化为数字
        var r: UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0
        Scanner(string: rrgb).scanHexInt32(&r)
        Scanner(string: grgb).scanHexInt32(&g)
        Scanner(string: brgb).scanHexInt32(&b)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), alpha: alpha)
    }
    
    
}
