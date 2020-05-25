//
//  RomanToInt.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/25.
//  Copyright © 2020 WangYonghe. All rights reserved.
//  13.罗马数字转整数(简单)
//  12.整数转罗马数字(中等)

import UIKit

/*
罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

示例 1:

输入: "III"
输出: 3
示例 2:

输入: "IV"
输出: 4
示例 3:

输入: "IX"
输出: 9
示例 4:

输入: "LVIII"
输出: 58
解释: L = 50, V= 5, III = 3.
示例 5:

输入: "MCMXCIV"
输出: 1994
解释: M = 1000, CM = 900, XC = 90, IV = 4.

*/


class RomanToInt: NSObject {

    func romanToInt(_ s: String) -> Int {
        
        let romanHash = ["I":1,
                         "V":5,
                         "X":10,
                         "L":50,
                         "C":100,
                         "D":500,
                         "M":1000]
        
        var reslutNum = 0
        
        for num in 0 ... s.count-1{
            let currentStr = s[s.index(s.startIndex, offsetBy: num)]
            let currentNum = romanHash[String(currentStr)] ?? 0
            
            if num == 0{
                reslutNum = reslutNum + currentNum
                continue
            }
            
            let lastStr = s[s.index(s.startIndex, offsetBy: num-1)]
            let lastNum = romanHash[String(lastStr)] ?? 0
            
            if currentNum <= lastNum {
                reslutNum = reslutNum + currentNum
            }else{
                reslutNum = reslutNum + currentNum - 2*lastNum
            }
        }
        return reslutNum
    }
    
    
    func intToRoman(_ num: Int) -> String {
        let romanHash = [1:"I",
                         4:"IV",
                         5:"V",
                         9:"IX",
                         10:"X",
                         40:"XL",
                         50:"L",
                         90:"XC",
                         100:"C",
                         400:"CD",
                         500:"D",
                         900:"CM",
                         1000:"M"]
        
        //先把数字拆分成数组
        /*
        例如 54(50+4)：拆分成50，4
            195(100+90+5)：拆分成100，90，5
        */
        
        
        var subNum = num
        var a = 1
        
        var resArr = [Int]()
        
        while subNum != 0  {
            let r = subNum%10
            resArr.insert(r*a, at: 0)
            a = a*10
            if a == 1000 {
                //由于罗马数字中最大的M只能表示到1000 因此后续不需要再拆分
                resArr.insert(num/a*a, at: 0)
                
                break
            }
            subNum = subNum/10
        }
        
        var resStringArr = [String]()
        
        var baseDivisor = 0
        
        if resArr.count == 1 {
            baseDivisor = 1
        }else if resArr.count == 2 {
            baseDivisor = 10
        }else if resArr.count == 3 {
            baseDivisor = 100
        }else{
            baseDivisor = 1000
        }
        
        for everyNum in resArr{
            if romanHash[everyNum] != nil {
                resStringArr.append(romanHash[everyNum]!)
            }else{
                resStringArr.append(self.getRomanFromInt(everyNum, baseDivisor))
            }
            baseDivisor = baseDivisor/10
        }
        
        let resultString = resStringArr.joined(separator: "")
        return resultString
    }
    

    func getRomanFromInt(_ num:Int,_ baseDivisor:Int)->String{
        if num == 0 {
            return ""
        }
        
        var currentNum = num
        var romanStr = ""
        
        var resultStr = ""
        
        if baseDivisor == 1 {
            romanStr = "I"
            if currentNum > 5 {
                resultStr = "V"
                currentNum = currentNum - 5
            }
        }else if baseDivisor == 10 {
            romanStr = "X"
            if currentNum > 50 {
                resultStr = "L"
                currentNum = currentNum - 50
            }
        }else if baseDivisor == 100 {
            romanStr = "C"
            if currentNum > 500 {
                resultStr = "D"
                currentNum = currentNum - 500
            }
        }else if baseDivisor == 1000 {
            romanStr = "M"
        }
        
        let loopNum = currentNum/baseDivisor
        
        for _ in 1...loopNum{
            resultStr = resultStr+romanStr
        }
        
        return resultStr
    }
    
    
    //比较简便的方法
    func convenientIdea(_ num: Int) -> String {
        let list1 = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        let list2 = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        var resultArr = [String]()
        
        var i = 0
        var myNum = num
        while myNum > 0 {
            if myNum - list1[i] >= 0 {
                resultArr.append(list2[i])
                myNum = myNum - list1[i]
            }else{
                i = i+1
            }
        }
        return resultArr.joined(separator: "")
    }
    
}
