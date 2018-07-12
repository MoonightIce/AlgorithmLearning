//
//  ViewController.swift
//  DisorderArrayFindMid
//
//  Created by DxMacmini on 2018/7/12.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func findIndexForApart(array:[Int], i:Int,j:Int ) -> Int  {
    var array = [4,5,6,1,2,3,0]
    var i = 0
    var j = array.count-1
    let key = array[i]
    while j > i {
        if array[j] >= key {
            j -= 1
        }
        let temp1 = array[j]
        array[j] = array[i]
        array[i] = temp1
        if array[i] <= key && j > i  {
            i += 1
        }
        let temp2 = array[i]
        array[i] = array[j]
        array[j] = temp2
    }
    print("\(i)")
    return i
}

func findMid(arrayChaged:[Int],n:Int) -> Int {
    let mid = (n-1)/2
    let start = 0
    let end = n-1
    var index = findIndexForApart(array: arrayChaged, i: start, j: end)
    while index != ((arrayChaged.count - 1)/2) {
        if mid < index{
            index = findIndexForApart(array: arrayChaged, i: start, j: index-1)
        }else{
            index = findIndexForApart(array: arrayChaged, i: index-1 , j: end)
        }
        
    }
    return arrayChaged[index]
}
