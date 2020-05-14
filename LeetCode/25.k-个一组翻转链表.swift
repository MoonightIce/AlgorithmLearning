/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
//  解法一： 栈 入栈在出栈就完成了翻转
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var stack = [ListNode?]()
        var dummy = ListNode(0)

        var list = head

        while true {
            var count = 0 
            var tmp = list 
            while tmp.next != nil && count != K{
                count += 1
                stack.append(tmp)
                tmp = tmp.next
            }

            if count != K {
                dummy.next = list
                break
            }

            while count > 0 {
                
            }
        }
    }
}
// @lc code=end

