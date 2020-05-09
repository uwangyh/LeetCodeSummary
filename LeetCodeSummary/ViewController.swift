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
        
        //
//        let twoSumObj = TwoSum()
//        let ret = twoSumObj.twoSumSimple(nums: [1,2,3,4,5,6,7], target: 3)
//        print(ret)
//
//        let resultArr = twoSumObj.twoSumResult(nums: [1,2,3,4,5,6,7], target: 8)
//        print(resultArr)
        
        let obj = CommenPrefix()
        let arr = obj.longestCommonPrefix([""])
        print("最长前缀:\(arr)")
    }


}

