//
//  TwoSum.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/8.
//  Copyright © 2020 WangYonghe. All rights reserved.
//  1：两数之和

import UIKit

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

 示例:
    给定 nums = [2, 7, 11, 15], target = 9

    因为 nums[0] + nums[1] = 2 + 7 = 9
    所以返回 [0, 1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class TwoSum: NSObject {
    
    func twoSumResult(nums: [Int], target: Int)->Array<Int>{
        
        var dict = [Int:Int]()
        for (i,num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex ,i]
            }else{
                dict[2] = 0
                dict[num] = i
            }
        }
        return []
    }
    
    
    //简化版本  只需判断是否存在两个数相加等于目标值
    func twoSumSimple(nums: [Int], target: Int)->Bool{
  
        var tmpArr:[Int] = []
        
        for element:Int in nums{
            if tmpArr.contains(target - element) {
                return true
            }else{
                tmpArr.append(element)
            }
        }
        
        return false
    }
}
