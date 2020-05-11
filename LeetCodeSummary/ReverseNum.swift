//
//  ReverseNum.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/9.
//  Copyright © 2020 WangYonghe. All rights reserved.
//  7：整数反转

import UIKit

/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 示例 3:

 输入: 120
 输出: 21
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class ReverseNum: NSObject {

    func reverseNumFunc1(_ x :Int)->Int{
        let stringNum = String("abs(x)".reversed())
        let reslut = x > 0 ? Int(stringNum)! : 0-Int(stringNum)!
        if reslut > INT32_MAX || reslut < Int32.min{
            return 0
        }else{
            return reslut
        }
    }
    
    
    func reverseNumFunc2(_ x :Int)->Int{
        

        return 0
    }
    
}
