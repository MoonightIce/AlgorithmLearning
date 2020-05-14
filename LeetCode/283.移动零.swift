/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 */

// @lc code=start
class Solution {
    // func moveZeroes(_ nums: inout [Int]) {
    //     //  遍历数据 记录 0 的个数 
    //     // 将非 0 数据往前移动当前 0 的个数的位数
    //     let count = nums.count
    //     var zeroCount = 0
    //     for (index, item) in nums.enumerated() {
    //         if item == 0 {
    //             zeroCount += 1
    //         }else {
    //             nums[index] = 0
    //             let correntIndex = index - zeroCount
    //             nums[correntIndex] = item
                
    //         }
    //     }
    // }

    // 双指针
    // func moveZeroes(_ nums: inout [Int]) {
    //     var notZeroIndex = 0
    //     for (index, item) in nums.enumerated() {
    //         if item != 0 {
    //             (nums[notZeroIndex], nums[index]) = (nums[index], nums[notZeroIndex])
    //             notZeroIndex += 1
    //         }
    //     }
    // }

    // 双循环
    func moveZeroes(_ nums: inout [Int]) {
        var notZeroIndex = 0
        for (index, item) in nums.enumerated() {
            if item != 0 {
                nums[notZeroIndex] = nums[index]
                notZeroIndex += 1
            }
        }
        for i in notZeroIndex..<nums.count {
            nums[i] = 0
        }
    }
}
// @lc code=end

