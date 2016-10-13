//
//  ViewController.swift
//  BMIDemo
//
//  Created by 許家旗 on 2016/10/13.
//  Copyright © 2016年 許家旗. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tf_height: UITextField!
    @IBOutlet weak var tf_weight: UITextField!
    @IBOutlet weak var l_BMI: UILabel!

    @IBAction func b_calcBMI(_ sender: AnyObject) {
        
        // BMI = 體重 / 身高米的平方
        
        let Height = Float(tf_height.text!)!
        let Weight = Float(tf_weight.text!)!
        // 因為考量身高跟體重有小數點,所以使用 Float 格式,另外 Float("String") 可以將 String 轉為 Float
        
        var myHeight = Height / 100     // 設定一個變數,讓身高從公分變公尺
        
        myHeight = myHeight * myHeight  // 讓身高變成 米平方
        
        let BMI = Weight / myHeight     // 計算 BMI 的值,並且讓他存到 BMI 常數裡面
        
        l_BMI.text = String(BMI)        // 讓 Label 顯示文字,內容為 BMI 的值
        
        // String(Any Value) 可以將括弧內的值變成文字
        
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        return true
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)           // 這邊是隱藏鍵盤用
    }
}

