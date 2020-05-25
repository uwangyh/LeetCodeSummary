//
//  ViewController.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/8.
//  Copyright © 2020 WangYonghe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("开始运行")
        
        //
//        let twoSumObj = TwoSum()
//        let ret = twoSumObj.twoSumSimple(nums: [1,2,3,4,5,6,7], target: 3)
//        print(ret)
//
//        let resultArr = twoSumObj.twoSumResult(nums: [1,2,3,4,5,6,7], target: 8)
//        print(resultArr)
        
//        let obj = CommenPrefix()
//        let arr = obj.longestCommonPrefix([""])
//        print("最长前缀:\(arr)")
        
//        let obj = MySqrt()
//        let num = obj.mySqrtFunc(7)
//        print("平方根结果：\(num)")
        
//        let obj = ReverseNum()
//        let num = obj.reverseNumFunc(-598)
//        print("整数反转结果：\(num)")
        
        
//        let obj = RomanToInt()
//        let num = obj.romanToInt("MCMXCIV")
//        print("罗马数字转整数结果：\(num)")
        
        let obj = RomanToInt()
        let num = obj.intToRoman(1994)
        print("整数转罗马数字结果：\(num)")
        
        
    }


}

