/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
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
//  链表算法中有一个比较常用的技巧之一： 哨兵

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {

    if head == nil || head?.next == nil {
        return head
    }

        // // 迭代
        // var node = head
        // var prev : ListNode?
        // while node != nil {
        //     let next = node?.next
        //     node?.next = prev
        //     prev = node
        //     node = next
        // }
        // return prev
    
    // 循环

    let node = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    return node

    }
}
// @lc code=end

