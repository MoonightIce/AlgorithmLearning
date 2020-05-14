/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
**/
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        if inorder.count == 0 || preorder.count == 0{
            return nil
        }

        var pre = preorder
        var iin = inorder  

        let val = pre.removeFirst()
        let root = TreeNode(val)
        let index = iin.firstIndex(of: val)!

        let left = Array(iin.dropLast(iin.count-index))
        let right = Array(iin.dropFirst(index+1))

        root.left = buildTree(pre, left)
        root.right = buildTree(pre, right)

        return root 
    }
}
// @lc code=end

