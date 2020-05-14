/*
 * @lc app=leetcode.cn id=24 lang=swift
 *
 * [24] 两两交换链表中的节点
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
 // 画图来得到目标链表
//  解法一： 迭代 - 在开头添加一个哨兵，统一每次交换逻辑
// 错误：直接交换，发现 1 和 2 的交换逻辑对于 3 和 4 的交换逻辑并不一致
// 因为 1 是头，而 3 是中间节点
// 理论上而言，在 4 后面跟一个无用节点，也能实现
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var prev = ListNode(0)
        prev.next = head

        var list = prev

        var fir = list.next
        var sec = list.next?.next

        while fir != nil {
        
        //  swapping  fir -> sec  =》   sec -> fir
            fir?.next = sec?.next
            sec?.next = fir
        //  续上前一个节点 0
            list.next = sec!

        //  更新交换节点
            list = fir!
            fir = fir?.next
            sec = fir?.next
            
        }
        return prev.next        
    }
}
// @lc code=end

