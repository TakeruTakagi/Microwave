//電子レンジ

import UIKit
import Foundation // Timerクラスを使用するために必要なモジュール
import PlaygroundSupport // Playground上でTimerクラスを機能させるために必要なモジュール

// デフォルトだとTimerクラスを継続的に処理させることが出来ないため、フラグを変更
PlaygroundPage.current.needsIndefiniteExecution = true

class Microwave{
    
    //500W、600W、700Wのワット数を選択できる
    enum wattage {
        case 500W
        case 600W
        case 700W
        
    //タイマーが「0」になったら「ピピピ」っとアラームを出力
    
        class Alarm {
            var timer: Timer?
            var count: Int = 0
            var limit: Int = 5
            
            func start() {
                // 任意の箇所でTimerクラスを使用して1秒毎にcountup()メソッドを実行させるタイマーをセット
                timer = Timer.scheduledTimer(
                    timeInterval: 1, // タイマーの実行間隔を指定(単位はn秒)
                    target: self, // ここは「self」でOK
                    selector: #selector(countup), // timeInterval毎に実行するメソッドを指定
                    userInfo: nil, // ここは「nil」でOK
                    repeats: true // 繰り返し処理を実行したいので「true」を指定
                )
            }
            
            //タイマーを最大「10分」までセットできる
            
            InputValue (_ value, 1 min, int 10)
            {
                if (value < min) {
                    return min;
                }
                else if (value > max) {
                    return max;
                }
                return value;
            }

            // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
            @objc func countup() {
                // countの値をインクリメントする
                count += 1
                print("カウントは\(count)です")
                // countの値がlimitの値以上になったif文を実行
                if limit <= count {
                    print("ピピピ！(カウントをストップします)")
                    // タイマーを止める
                    timer?.invalidate()
                }
            }
        }

        let alarm = Alarm()
        alarm.start()
}

