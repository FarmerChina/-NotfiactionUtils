//
//  Random.swift
//  KuPoMarket
//
//  Created by 宁国通 on 2016/12/19.
//  Copyright © 2016年 宁国通. All rights reserved.
//

import UIKit

/// 在指定范围内生成随机数，同时每次生成的随机数都不重复。
class RandomUtils: NSObject {
    //随机数生成器函数
   static func createRandomMan(start: Int, end: Int)  ->Int! {
        //根据参数初始化可选值数组
        var nums = [Int]();
        for i in start...end{
            nums.append(i)
        }
        
        func randomMan() -> Int! {
            if !nums.isEmpty {
                //随机返回一个数，同时从数组里删除
                let index = Int(arc4random_uniform(UInt32(nums.count)))
                return nums.remove(at: index)
            }
            else {
                //所有值都随机完则返回nil
                return nil
            }
        }
        return randomMan()
    }
}
