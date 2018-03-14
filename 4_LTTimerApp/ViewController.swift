//
//  ViewController.swift
//  4_LTTimerApp
//
//  Created by 遠山　聡美 on 2018/03/08.
//  Copyright © 2018年 Simple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //タイマーの動作を確認するための一時的なラベル
    @IBOutlet weak var tmp: UILabel!
    
    //時間表示のラベル
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //タイマー
    var timer: Timer!
    
    //カウント
    var count:Int = 300

    //スタートボタン
    @IBAction func tapStartButton(_ sender: Any) {
        //timerを動かした時の処理
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.count -= 1
            self.tmp.text = String(self.count)
        })
    }

    //ストップボタン
    @IBAction func tapStopButton(_ sender: Any) {
        //タイマーを停止した時の処理
        timer.invalidate()
        
    }
    
    //リセットボタン
    @IBAction func tapResetButton(_ sender: Any) {
        count = 300
        tmp.text = "300"
    }
    
    //タイムアップの時の動作
    
    //画像のアニメーション
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

