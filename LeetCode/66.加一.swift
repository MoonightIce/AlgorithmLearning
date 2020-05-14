/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 */

// @lc code=start
// 解法一： 根据是否需要进位再计算
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var nums = digits
        // 是否需要进位
        var max = 0
        if nums[nums.count - 1] == 9{
            max = 1
        }
        for i in 0..<nums.count {
            let index = nums.count - i - 1
            // 需要进位
            if max == 1 {
                nums[index] = 0
                // 前一位存在
                if index > 0 {
                    if nums[index - 1] == 9 {
                        max = 1
                    }else{
                        max = 0
                    }
                }else {
                    //  前一位不存在，但是需要进位
                    nums.insert(1, at: 0)
                }
            }else {
                 nums[index] += 1 
                 break
            }
        }

        return nums

    }
}

// 改进： 

// @lc code=end

