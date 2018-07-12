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
        var array = [4,5,6,1,2,3,0]
        var i = 0
        var j = array.count-1
        let key = array[i]
        while  i < j {
            if array[j] >= key && j > i  {
                j -= 1
            }
                var temp1 = array[i]
                array[i] = array[j]
                array[j] = temp1
                j -= 1
            
            if array[i] <= key && j > i  {
                i += 1
            }
                var temp2 = array[i]
                array[i] = array[j]
                array[j] = temp2
                i += 1
        }
        print("\(i)")
  
    }

    func findMid(array: Array<Any>,num: int) -> int {
        <#function body#>
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

