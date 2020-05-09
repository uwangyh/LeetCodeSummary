//
//  CommenPrefix.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/8.
//  Copyright © 2020 WangYonghe. All rights reserved.
//  最长公告前缀

import UIKit

/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

 示例 1:

 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:

 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:

 所有输入只包含小写字母 a-z 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-common-prefix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class CommenPrefix: NSObject {

    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0{
            return ""
        }
        if strs.count == 1{
            return strs[0]
        }
        
        var commonStr = ""
        var loopIndex = 0
        
        //取出第一个字符串
        let firstString:String = strs[0]
        
        var subArr = strs
        subArr.removeFirst()
        
        while true {
            for string in subArr{
                let childStr = string
                
                if childStr.count > loopIndex && firstString.count > loopIndex{
                    let cutStr = childStr[childStr.index(childStr.startIndex, offsetBy: loopIndex)]
                    
                    let firCutStr = firstString[firstString.index(firstString.startIndex, offsetBy: loopIndex)]
                    
                    if cutStr == firCutStr{
                        continue
                    }else{
                        if loopIndex >= 1 {
                            //存在至少一个公共前缀
                            commonStr = String(strs[0].prefix(loopIndex))
                        }
                        return commonStr
                    }
                }else{
                    if loopIndex >= 1 {
                        //存在至少一个公共前缀
                        commonStr = String(strs[0].prefix(loopIndex))
                    }
                    return commonStr
                }
            }
            loopIndex = loopIndex + 1
        }
    }
    
    
    
    
    func stringToAscii(c:Character) ->Int{
        var numberFromC=0
        //使用for-in循环遍历转化成String的“B”
        for scalar in String(c).unicodeScalars{
            //字符串只有一个字符，这个循环只会执行1次
            numberFromC = Int(scalar.value)
        }
        return numberFromC
    }
}
