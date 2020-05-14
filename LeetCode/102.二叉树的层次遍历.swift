/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层次遍历
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
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }

        var ans = [[Int]]()
        var stack = [root]
        while stack.count > 0 {
            var res = [Int]()
            var tmp = [TreeNode?]()
            while stack.count > 0 {
                let node  = stack.removeFirst()
                if node != nil {
                    res.append(node!.val)
                    tmp.append(node?.left)
                    tmp.append(node?.right)
                }
            }
            stack = tmp
            if res.count > 0 {
                ans.append(res)
            }
        }
        return ans
    }
}

// BFS 也可以实现，但是需要的时间为指数级别
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        levelArray(root, 1, &ans)
        return ans
    }

    func levelArray(_ root: TreeNode?, _ level: Int, _ ans: inout [[Int]]) {
        if root == nil {
            return
        }
        if level > ans.count {
            ans.append([root!.val])
        } else {
            ans[level-1].append(root!.val)
        }
        levelArray(root?.left, level+1, &ans)
        levelArray(root?.right, level+1, &ans)

    }
}
// @lc code=end

