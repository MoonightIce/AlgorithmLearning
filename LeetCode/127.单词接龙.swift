/*
 * @lc app=leetcode.cn id=127 lang=swift
 *
 * [127] 单词接龙
 */

// @lc code=start

- 简单未优化解答（超出时间限制）

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) {
            return 0
        }
        let ob = "qwertyuiopasdfghjklzxcvbnm"
        let obArray = Array(ob)
        var stack = [String]()
        var visited = [String]()
        stack.append(beginWord)
        var ans = 0
        while !stack.isEmpty {
            ans += 1
            for word in stack {
                stack.removeFirst()
                var wordArray = Array(word)
                for i in 0..<word.count {
                    let tmp = wordArray[i]
                    for j in 0..<obArray.count {
                        wordArray[i] = obArray[j]
                        let str = String(wordArray)
                        if str == endWord {
                            return ans + 1
                        }else if wordList.contains(str) && !visited.contains(str) {
                            stack.append(str)
                            visited.append(str)
                        }
                    }
                    wordArray[i] = tmp
                }
            }
            
        }
        return 0
    }
}

// 优化记录
    // 1. 增加 visited ，但是仍然超出时间限制
    // 2. 用 list 删除访问过的单词，通过测试，但是是时间长达 2000 ms
    
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var list = Set(wordList)

        if !list.contains(endWord) {
            return 0
        }
        let ob = "qwertyuiopasdfghjklzxcvbnm"
        let obArray = Array(ob).map({String($0)})
        var stack = [String]()
        stack.append(beginWord)
        var ans = 0
        while !stack.isEmpty {
            ans += 1
            for word in stack {
                let word = stack.removeFirst()
                var wordArray = Array(word).map({String($0)})
                for i in 0..<word.count {
                    let tmp = wordArray[i]
                    for j in 0..<obArray.count {
                        wordArray[i] = obArray[j]
                        let str = wordArray.reduce("", +)
                        if str == endWord {
                            return ans + 1
                        }else if list.contains(str)  {
                            stack.append(str)
                            list.remove(str)
                        }
                    }
                    wordArray[i] = tmp
                }
            }
            
        }
        return 0
    }
}

- 再优化
// 在 2 的基础上，将 string 转化为 array 再换回 string 比较替换成修改 string  时间可减少一半到 700ms 左右

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var list = Set(wordList)

        if !list.contains(endWord) {
            return 0
        }
        let ob = "qwertyuiopasdfghjklzxcvbnm"
        let obArray = Array(ob).map({String($0)})
        var stack = [String]()
        // var visited = [String]()
        stack.append(beginWord)
        var ans = 0
        while !stack.isEmpty {
            ans += 1
            print("\(stack)")
            for word in stack {
                let word = stack.removeFirst()
                var wordArray = Array(word).map({String($0)})
                for i in 0..<word.count {
                    var new = word
                    let index = new.index(new.startIndex, offsetBy: i)
                    for j in 0..<obArray.count {
                        // 替换字符处理
                        new.replaceSubrange(index...index, with: obArray[j])
                        if new == endWord {
                            return ans + 1
                        }else if list.contains(new) {
                            stack.append(new)
                            list.remove(new)                            
                        }
                    }
                }
            }
            
        }
        return 0
    }
}


// BFS 广度优先中还有一个双向广度搜索
// 和当向广度搜索区别
// 1. 每次选择处理个数较少的数组
// 2. 每次转换成合法的单词时，需要先判断在 end 数组中是否包含，如果有则直接返回结果
// 3. 这时候 remove 的方式，并不比用 visited 的快
// 4. 200ms

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let list = Set(wordList)
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
                begin.removeFirst()
                for i in 0..<word.count {
                    var new = word
                    let index = new.index(new.startIndex, offsetBy: i)
                    for j in 0..<obArray.count {
                        new.replaceSubrange(index...index, with: obArray[j])
                        if list.contains(new) {
                            if end.contains(new) {
                                return ans + 1
                            }else if !visited.contains(new) {
                                tmp.insert(new)
                                viited.insert(new)                            
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

//  当前已知最优解
//  108ms
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // 处理 list
        if !wordList.contains(endWord){
            return 0
        }

        let dict = Set(wordList)
        var beginSet = Set<String>()
        var endSet = Set<String>()    
        var visitedSet = Set<String>()
        var length = 1
        var found = false
        
        beginSet.insert(beginWord)
        endSet.insert(endWord)
        
        while !found && !beginSet.isEmpty && !endSet.isEmpty {
            var nextSet = Set<String>()
            //accelerating search speed by swap begin and end
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            found = helper(beginSet, endSet, dict, &visitedSet, &nextSet)
            beginSet = nextSet
            length += 1
        }
        return found ? length : 0
    }
    
    private func helper(_ beginSet: Set<String>, _ endSet: Set<String>, _ dict: Set<String>,
                        _ visitedSet: inout Set<String>, _ resSet: inout Set<String>) -> Bool {
        
        let alphaArray = Array("abcdefghijklmnopqrstuvwxyz")
        
        for word in beginSet {
            for i in 0 ..< word.count {
                var chars = Array(word)
                for j in 0 ..< alphaArray.count{
                    chars[i] = alphaArray[j]
                    let str = String(chars)
                    if dict.contains(str) {
                        if endSet.contains(str) 
                        { 
                            return true 
                        }
                        if !visitedSet.contains(str) 
                        { 
                            resSet.insert(str)
                            visitedSet.insert(str) 
                        }
                    }
                }
            }
        }
        return false
    }
}
// @lc code=end

