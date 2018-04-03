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
    
    //タイマーが動いているかの判定
    var timerRinning:Bool = false

    //タイマー
    var timer: Timer!

    //カウンターのデフォルトの値
    var defaultCount:Int = 300
    
    //残り時間をカウントするための変数
    var count:Int = 0
    
    //デフォルト値でのラベル表示
    var defaultCountLabel:String = ""
    
    //画像
    @IBOutlet weak var dogImage: UIImageView!
    

    //スタートボタンを押した時の処理
    @IBAction func tapStartButton(_ sender: Any) {
        //タイマーの動作判定
        if timerRinning {
            //動いている時は処理をスキップ
            return
        }
        
        //タイマーの動作判定を変更
        timerRinning = true
        
        //タイマーのカウントダウン処理
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in self.timerAction()
        })
    }
    
    
    //タイマーを動かした時に表示を変更する関数
    func timerAction() {
        //カウンターを減らす
        count -= 1
        
        //タイマー表示を変更する
        let min: Int = count / 60
        let sec: Int = count % 60
        timerLabel.text = "\(min):" + String(format: "%02d", sec)

        //画像のアニメーション処理
        imageAnimetion(img: #imageLiteral(resourceName: "dog"))
        
        //タイムアップの時の処理
        if count == 0 {
            //タイマーの処理を停止する
            timer.invalidate()
            //タイムアップの文字の表示
            self.timerLabel.text = "タイムアップー"
            //タイムアップ画像の表示
            dogImage.image = #imageLiteral(resourceName: "finish")
            //元のサイズに戻す
            dogImage.transform = CGAffineTransform(scaleX: CGFloat(1), y: CGFloat(1))
        }
    }
    
    
    //画像を小さくする処理
    func imageAnimetion(img:UIImage) {
        let rate = Float(count) / Float(defaultCount)
        dogImage.transform = CGAffineTransform(scaleX: CGFloat(rate), y: CGFloat(rate))
    }
    
    
    //ストップボタンを押した時の処理
    @IBAction func tapStopButton(_ sender: Any) {
        //タイマーを停止する
        timer.invalidate()
        //タイマーの動作判定を変更する
        timerRinning = false
    }
    
    
    //リセットボタンを押した時の処理
    @IBAction func tapResetButton(_ sender: Any) {
        //タイマーを停止する
        timer.invalidate()
        //タイマーの動作判定を変更する
        timerRinning = false
        //カウンターリセットする
        count = defaultCount
        //タイマー表示をリセットする
        self.timerLabel.text = defaultCountLabel
        //元の画像に戻す
        dogImage.image = #imageLiteral(resourceName: "dog")
        //元のサイズに戻す
        dogImage.transform = CGAffineTransform(scaleX: CGFloat(1), y: CGFloat(1))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = #imageLiteral(resourceName: "dog")
        count = defaultCount
        defaultCountLabel = "\(defaultCount / 60)" + ":" + String(format: "%02d", (defaultCount % 60))
        timerLabel.text = defaultCountLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
