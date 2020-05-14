/*
 * @lc app=leetcode.cn id=189 lang=swift
 *
 * [189] 旋转数组
    1. 暴力求解，从末尾取出并删除一位，然后插入到第一位，循环求解
    2. 取出最后一位，将前 n-1 个数全部往后移动一位，替换第一位，循环求解
    3. 从第一位开始，将 k+1 的数据取出并替换，从 k+1 位置继续计算
       根据 （k+1）/nums.count .一次只移动一位。
    1,2,3,4,5,6,7,8，9

    nums.count/k =  0
    k =5
    (k 次内循环)
 */

// @lc code=start
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var sz = nums.count
        var n = nums.count
        var step = k%n
        if(n<2 || step<1){
            return
        } 
        var i = step
        while n > 0 {
            var j=i
            var prev=nums[(i - step)%step]
            while n > 0 {
                n -= 1
                (prev , nums[j]) = (nums[j], prev)
                j = (j + step)%sz
                if (j == i ){
                    break
                }
                    
            }
            i += 1
        }
    }
}
// @lc code=end

