//
//  BasicDataStruct.swift
//  LeetCodeSummary
//
//  Created by WangYonghe on 2020/5/8.
//  Copyright © 2020 WangYonghe. All rights reserved.
//

import UIKit

class BasicDataStruct: NSObject {

}


//链表的节点
public class ListNode: NSObject{
    public var val: Int
    public var next: ListNode?
    
    public init(_val: Int){
        self.val = _val
        self.next = nil
    }
}




//栈结构
public class Stack: NSObject{
    public var stackSource: Array<Any> = []
    public var size:Int{
        return stackSource.count
    }
    public var isEmpty: Bool{
        return stackSource.count == 0
    }
    
    public func push(elememt: stackElement){
        stackSource.append(elememt)
    }
    
    public func pop(){
        if isEmpty == false {
            stackSource.removeLast()
        }else{
            isValidStackOper = false
        }
    }
    
    public var isValidStackOper: Bool = true
    
}
//栈元素
public class stackElement{
    public var eleValue: Int = 10
    public var eleStringValue: String? = ""
    
    public init(str:String){
        self.eleStringValue = str
    }
}



//二叉树
public class TreeNode{
    public var val: Int = 0
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_val: Int){
        self.val = _val
    }
    
    //计算树的最大深度
    func maxDepth(root: TreeNode!)->Int{
        guard root == nil else {
            return 0
        }
        return max(maxDepth(root: root.left),maxDepth(root: root.right)) + 1
    }
    
    //是否是二叉查找树
    func isValidSeachTree(root: TreeNode)-> Bool{
        return help(node: root, min: nil, max: nil)
    }
    func help(node:TreeNode?, min :Int?, max :Int?) -> Bool{
        guard node != nil else {
            return true
        }
        if min != nil && node!.val < min! {
            return false
        }
        if max != nil && node!.val > max! {
            return false
        }
        return help(node: node?.left, min: min, max: node?.val) && help(node: node?.right, min: node?.val, max: max)
    }
    
    //二叉树的遍历
    //递归实现二叉树遍历
    func recuTraersal(root: TreeNode!){
        guard root != nil else {
            return
        }
        //前、中、后遍历只需改变一下三行代码的顺序
        print("\(root.val) ")
        recuTraersal(root: root.left)
        recuTraersal(root: root.right)
    }
    
    //用栈实现前序遍历
    func preorderTraversal(root: TreeNode?) -> [Int]{
        var res = [Int]()
        var stack = [TreeNode]()
        var node = root

        while !stack.isEmpty || node != nil {
            if node != nil {
                res.append(node!.val)
                stack.append(node!)
                node = node!.left
            }else {
                node = stack.removeLast().right
            }
        }
        return res
    }

    
    //二叉树倒置 ---递归
    func MirroTree(root: TreeNode?){
        guard root != nil else {
            return
        }
        if root?.left == nil && root?.right == nil {
            return
        }
        let tempNode:TreeNode = root!.left!
        root?.left = root?.right
        root?.right = tempNode
        MirroTree(root: root?.left)
        MirroTree(root: root?.right)
    }
}
