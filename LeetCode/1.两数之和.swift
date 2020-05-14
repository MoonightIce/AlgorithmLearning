/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 必须遍历整个数组
        // 两层循环
        // for i in 0..<nums.count-1 {
        //     for j in (i + 1)..<nums.count {

        //     }
        // }
        var prev = 0 
        var last = nums.count - 1 
        var res = [Int]()
        while prev < last {
            let sum = nums[prev] + nums[last]
            if sum == target {
                res = [prev, last]
                break
            }else if sum > target {
                last -= 1
            }else if sum < target {
                prev += 1
            }
        }
        return res
    }
}
// @lc code=end

