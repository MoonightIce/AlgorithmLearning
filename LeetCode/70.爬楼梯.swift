/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 */

// @lc code=start
class Solution {
    func climbStairs(_ n: Int) -> Int {
            if n == 1 {
                return 1
            }
            if n == 2 {
                return 2
            }
            var first = 1
            var second = 2
            var count = n
            while count <= 3 {
                count -= 1
                let third = first + second
                first = second
                second = third
            }
            return second
    }

}
// @lc code=end
