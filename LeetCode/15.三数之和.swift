/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 */

// @lc code=start
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
    let sortNums = nums.sorted(by: <)
        var res = [[Int]]()
        for k in 0..<(sortNums.count - 2) {

            if k > 0 ,sortNums[k] == sortNums[k-1] {
                continue
            }
            
            var i = k + 1
            var j = sortNums.count - 1
            while i < j {
                let sum = sortNums[i] + sortNums[j] + sortNums[k]
                if sum == 0 {
                    res.append([sortNums[i] , sortNums[j] , sortNums[k]])
                    i += 1
                    j -= 1
                    
                    while i < j {
                        if sortNums[i] == sortNums[i-1]{
                            i += 1
                        }else{
                            break
                        }
                    }
                    
                    while i < j {
                        if sortNums[j] == sortNums[j+1]{
                            j -= 1
                        }else{
                            break
                        }
                    }
                    
                }else if sum > 0 {
                    j -= 1
                    while i < j {
                        if sortNums[j] == sortNums[j+1]{
                            j -= 1
                        }else{
                            break
                        }
                    }
                }else if sum < 0 {
                    i += 1
                    while i < j {
                        if sortNums[i] == sortNums[i-1]{
                            i += 1
                        }else{
                            break
                        }
                    }
                }
            }
        }
        return res
    }
}
// @lc code=end

