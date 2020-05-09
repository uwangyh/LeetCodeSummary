//
//  MySqrt.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/9.
//  Copyright © 2020 WangYonghe. All rights reserved.
//  69：x的平方根

import UIKit

/*

 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:

 输入: 4
 输出: 2
 示例 2:

 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。
 */

class MySqrt: NSObject {

    func mySqrtFunc(_ x: Int) -> Int {
        guard x > 0 else {
            return 0
        }
        guard x != 1 else{
            return 1
        }

        var min = 0
        var max = x
        while true {
            //使用二分法
            if min < max{
                let middle = min+(max-min)/2+1
                if middle*middle > x {
                    max = middle-1
                }else if middle*middle == x || middle == min{
                    return middle
                }else{
                    min = middle
                }
            }else{
                return min
            }
            
        }
    }
    /*
     return Int(sqrt(Double(x)))
     */
}
