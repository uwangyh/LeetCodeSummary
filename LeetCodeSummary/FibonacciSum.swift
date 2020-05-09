//
//  FibonacciSum.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/8.
//  Copyright © 2020 WangYonghe. All rights reserved.
//  斐波拉契数列求和

import UIKit


/*

 //斐波拉契数列求和----动态规划问题
 
 斐波拉契数列是这样一个数列：1, 1, 2, 3, 5, 8, ... 除了第一个和第二个数字为 1 以外，其他数字都为之前两个数字之和。现在要求第 100 个数字是多少。
 
 */
class FibonacciSum: NSObject {
    
    //裴波那切数列求和
    var nums = Array(repeating: 0, count: 100)
    
    func Fib(n: Int) -> Int{
        guard n > 0 else {
            return 0
        }
        if n == 1 || n == 2{
            return 1
        }
        
        //如果已经计算过 直接调用 无需重复计算
        if nums[n - 1] != 0{
            return nums[n - 1]
        }
        //将计算后的值存入数组
        nums[n - 1] = Fib(n: n - 1) + Fib(n: n - 2)
        
        return nums[n - 1]
        //return Fib(n: n - 1) + Fib(n: n - 2)
    }
    
    func getSum(){
        print(Fib(n: 100))
    }
}

/*
 动态转移虽然看上去十分高大上，但在面试中遇到相关问题要注意以下两点：

 栈溢出：每一次递归，程序都会将当前的计算压入栈中。随着递归深度的加深，栈的高度也越来越高，直到超过计算机分配给当前进程的内存容量，程序就会崩溃。
 数据溢出：因为动态规划是一种由简至繁的过程，其中积蓄的数据很有可能超过系统 当前数据类型的最大值，从而导致程序抛出异常。
 
 这两点，我们在上面这道求解斐波拉契数列第100个数的题目就都遇到了。

 首先，递归的次数很多，我们要从 F(100) = F(99) + F(98) ，一直推理到 F(3) = F(2) + F(1)，这样很容易造成栈溢出。
 其次，F(100) 应该是一个很大的数。实际上 F(40) 就已经突破一亿，F(100) 一定会造成整型数据溢出。
 */
