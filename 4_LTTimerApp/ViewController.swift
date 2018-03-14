//
//  ViewController.swift
//  4_LTTimerApp
//
//  Created by 遠山　聡美 on 2018/03/08.
//  Copyright © 2018年 Simple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //時間表示のラベル
    @IBOutlet weak var timerLabel: UILabel!
    
    //タイマー
    var timer: Timer!
    
    //カウント
    var count:Int = 5

    //スタートボタンを押した時の処理
    @IBAction func tapStartButton(_ sender: Any) {
        //タイマーを動かす
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in self.timerAction()
            print(self.count)
        })
    }
    
    //タイマーを動かした時に表示を変更する処理
    func timerAction() {
        //カウンターを減らす
        count -= 1
        
        //タイマー表示を変更する
        let min: Int = count / 60
        let sec: Int = count % 60
        timerLabel.text = "\(min):" + String(format: "%02d", sec)
        //0秒の時にタイマーを停止する
        if count == 0 {
            timer.invalidate()
        }
        
    }
    
    //ストップボタンを押した時の処理
    @IBAction func tapStopButton(_ sender: Any) {
        //タイマーを停止する
        timer.invalidate()
    }
    
    //リセットボタンを押した時の処理
    @IBAction func tapResetButton(_ sender: Any) {
        //タイマーを停止する
        timer.invalidate()
        
        //カウンターリセットする
        count = 300
        
        //タイマー表示をリセットする
        self.timerLabel.text = "5:00"
    }
    
    
    //画像のアニメーション
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

