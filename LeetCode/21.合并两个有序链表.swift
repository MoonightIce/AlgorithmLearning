/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
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
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var first = l1?.val
        var second = l2?.val

        var res = ListNode.init(0)
        while first.next == nil && second.next == nil {
            if first > second {
                res.next = first
                if first.next != nil {
                    first = first.next
                }
            }else {
                res.next = second
                if second.next != nil{
                    second = second.next
                }
            }
        }

    }
}
// @lc code=end

