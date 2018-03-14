//
//  ViewController.swift
//  4_LTTimerApp
//
//  Created by 遠山　聡美 on 2018/03/08.
//  Copyright © 2018年 Simple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //スタートボタン
    @IBAction func tapStartButton(_ sender: Any) {
    }
    //リセットボタン
    @IBAction func tapResetButton(_ sender: Any) {
    }
    
    @IBAction func tapStopButton(_ sender: Any) {
    }
    
    //時間表示のラベル
    @IBOutlet weak var timerLabel: UILabel!
    
    //タイマー
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

