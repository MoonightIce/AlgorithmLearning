/*
 * @lc app=leetcode.cn id=127 lang=swift
 *
 * [127] 单词接龙
 */

// @lc code=start
// 思路一个单词，每次只能改变一个字符，且改变后的单词需要在字典中
// 从开始单词，需要改变多少次，变成目标单词

// BFS 或 DFS

// BFS 
// 错误二，在比较 新的 str 和 endWord 时，此时直接 return 需要 + 1
// 优化记录
    // 1. 增加 visited ，但是仍然超出时间限制
    // 2. 用 list 删除访问过的单词，通过测试，但是是时间长达 2000 ms
    // 3. 在 2 的基础上，将 string 转化为 array 再换回 string 比较替换成修改 string  时间可减少一半到 700ms 左右
// class Solution {
//     func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
//         var list = Set(wordList)
//         if !list.contains(endWord) {
//             return 0
//         }
//         let ob = "qwertyuiopasdfghjklzxcvbnm"
//         let obArray = Array(ob).map({String($0)})
//         var stack = [String]()
//         // var visited = [String]()
//         stack.append(beginWord)
//         var ans = 0
//         while !stack.isEmpty {
//             ans += 1
//             print("\(stack)")
//             for word in stack {
//                 let word = stack.removeFirst()
//                 // 优化二
//                 // var wordArray = Array(word).map({String($0)})
//                 for i in 0..<word.count {
//                     var new = word
//                     let index = new.index(new.startIndex, offsetBy: i)
//                     for j in 0..<obArray.count {
//                         // 优化三
//                         // 替换字符处理
//                         new.replaceSubrange(index...index, with: obArray[j])
//                         if new == endWord {
//                             return ans + 1
//                         }else if list.contains(new) {
//                             stack.append(new)
//                             // 优化二
//                             list.remove(new)                            
//                         }
//                     }
//                 }
//             }
            
//         }
//         return 0
//     }
// }

// BFS 广度优先中还有一个双向广度搜索
// 和当向广度搜索区别
// 1. 每次选择处理个数较少的数组
// 2. 每次转换成合法的单词时，需要先判断在 end 数组中是否包含，如果有则直接返回结果
// 3. 应该是不能采用 remove 已访问单词达到 visited 的效果
// 

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var list = Set(wordList)
        if !list.contains(endWord) {
            return 0
        }
        let ob = "qwertyuiopasdfghjklzxcvbnm"
        let obArray = Array(ob).map({String($0)})
        var begin = Set<String>()
        var end = Set<String>()
        var visited = Set<String>()
        begin.insert(beginWord)
        end.insert(endWord)
        var ans = 1
        while !begin.isEmpty && !end.isEmpty {

            if begin.count > end.count {
                let temp  = begin
                begin = end
                end = temp
            }
            var tmp = Set<String>()
            for word in begin {
                let word = begin.removeFirst()
                for i in 0..<word.count {
                    var new = word
                    let index = new.index(new.startIndex, offsetBy: i)
                    for j in 0..<obArray.count {
                        new.replaceSubrange(index...index, with: obArray[j])
                        if list.contains(new) {
                            if end.contains(new) {
                                return ans + 1
                            }else  {
                                // if !visited.contains(new)
                                tmp.insert(new)
                                list.remove(new)                            
                            }
                        }
                    }
                }
            }
            begin = tmp
            ans += 1
        }
        return 0
    }
}


// DFS
// 
// class Solution {
//     func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {

//     }
// }
// @lc code=end

