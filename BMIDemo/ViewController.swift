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
        
        // 因為考量身高跟體重有小數點,所以使用 Float 格式,另外 Float("String") 可以將 String 轉為 Float
        let Height = Float(tf_height.text!)!
        let Weight = Float(tf_weight.text!)!
        
        // 設定一個變數,讓身高從公分變公尺
        var myHeight = Height / 100
        // 讓身高變成 米平方
        myHeight = myHeight * myHeight
        // 計算 BMI 的值,並且讓他存到 BMI 常數裡面
        let BMI = Weight / myHeight
        // String(Any Value) 可以將括弧內的值變成文字
        l_BMI.text = String(BMI)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
        
        // tf_height & tf_weight 綁定 UITextFieldDelegate
        tf_height.delegate = self
        tf_weight.delegate = self
    
        // 這邊我增加了點擊空白處可以隱藏鍵盤用
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        return false
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)           // 這邊是隱藏鍵盤用
    }
}

