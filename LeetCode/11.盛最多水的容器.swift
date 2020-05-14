/*
 * @lc app=leetcode.cn id=11 lang=swift
 *
 * [11] 盛最多水的容器
 */

// @lc code=start
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var j = height.count - 1
        var i = 0 
        var max = 0
        while i < j {
            let wid = j - i
            let high = height[i] < height[j] ? height[i] : height[j]
            let area = wid*high
            max = max > area ? max : area
            if height[i] - height[j] > 0 {
                j -= 1
            }else {
                i += 1
            }
        }
        return max
    }
}
// @lc code=end

