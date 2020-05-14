/*
 * @lc app=leetcode.cn id=26 lang=swift
 *
 * [26] 删除排序数组中的重复项
    1. 双指针，慢指针指向非重复项位置，快指针指向最新判断的数据
 */

// @lc code=start
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1{
            return 1
        }

        var slow = 0
        for i in 1..<nums.count {
            if nums[slow] != nums[i] {
                slow += 1
                nums[slow] = nums[i]
            }
        }
        return slow+1
    }
}
// @lc code=end

