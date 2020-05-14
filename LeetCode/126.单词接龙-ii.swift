/*
 * @lc app=leetcode.cn id=126 lang=swift
 *
 * [126] 单词接龙 II
 */

// @lc code=start
// 较优解法： BFS + DFS
// 利用 BFS 找到并存储最优路径，利用 DFS 输出路径
// 广度优先查找中 处理当前单词，获取到所有“相邻单词“
// 在所有相邻单词中，需要判断是否合法，是否已经存入深度集合（是否访问）
// 遍历符合要求的新单词，存储相邻关系，和对应深度。判断是否和目标单词相等，然后入队列准备处理
// 全部处理完成之后，得到一个深度集合，一个相邻关系表
// 

// DFS 
// 利用相邻关系表，获取到下一级的单词，判断两个单词深度相差是否为一
// 如果差为 1，则继续递归查询
// 为什么会出现差不为一的情况.相邻关系表中只是保证合法性，层级相邻说明是最短路径
class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {

        
        var dictionary = Set(wordList)

        dictionary.insert(beginWord)
        // 存储相邻关系
        var neibers = [String: [String]]()
        // 记录路径
        var distance = [String: Int]()

        bfs(beginWord, endWord, dictionary ,&distance, &neibers)
        

         
        var list = [String]()
        var ans = [[String]]()

        dfs(beginWord, endWord, distance, neibers, &list, &ans)

        return ans
    }


    func bfs(_ beginWord: String, _ endWord: String, _ dictionary: Set<String>, _ distance: inout [String: Int],_ neibers: inout [String: [String]]) {
        let ob = Array("qwertyuiopasdfghjklzxcvbnm").map({String($0)})
        distance[beginWord] = 0
        var stack = [String]()
        var found = false
        stack.append(beginWord)

        while !stack.isEmpty {
            var tmp = [String]()
            for word in stack {
                var neis = [String]()
                for i in 0..<word.count {
                    var new = word
                    let index = new.index(new.startIndex, offsetBy: i)
                    for j in 0..<ob.count {
                        new.replaceSubrange(index...index, with: ob[j])
                        if dictionary.contains(new)  {
                            neis.append(new)
                        }    
                    }
                }
                neibers[word] = neis
                let level = distance[word]!
                for nei in neis {
                    if distance[nei] == nil {
                        distance[nei]  = level + 1
                        if nei == endWord {
                            found = true
                        }else {
                            tmp.append(nei)
                        }
                    }
                }
                
            }
            if found {
                break
            }
            stack = tmp
        }
    }



    func dfs(_ beginWord: String, _ endWord: String, _ distance: [String: Int], _ neibers: [String: [String]], _ list: inout [String],_ ans : inout [[String]] ) {
        list.append(beginWord)
        if beginWord == endWord {
            ans.append(list)
            return
        }
       
        let level = distance[beginWord]!
        for word in neibers[beginWord]! {
            if distance[word]! == level + 1 {
                dfs(word, endWord, distance, neibers, &list, &ans)
            }
        }
        list.removeLast()
    }

}
// @lc code=end

