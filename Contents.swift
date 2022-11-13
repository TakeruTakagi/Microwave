//電子レンジ
//500,600,700Wを選択可能
//タイマーは最大10分まで設定可能

//2022/10/26 フィードバック

//500W、600W、700Wのワット数を選択できる
//定義はenumでOK :ok
//メソッド実行時にワット数を選択できるようにする :ok
//選択されたことがわかるようにPrint出力できるようにする :ok

//タイマー機能
//initでクラス初期化する時に timerをセットできるようにする
//セットされたタイマーが10分より上ならタイマーをスタートさせない
//Printでエラー内容を表示
//その他
//今もやられてると思いますが動画教材や今実装しているコードに対して「1行1行に対して日本語でコメントを書く」を今一度意識してやってみましょう:+1:
//これを行うことで「コードの意味を日本語で理解」することができるようになります
//コードを日本語で理解できると、「日本語→コード」の変換もできるようになり、応用学習の課題制作もできるようになります

import Foundation // Timerクラスを使用するために必要なモジュール
import PlaygroundSupport // Playground上でTimerクラスを機能させるために必要なモジュール

// デフォルトだとTimerクラスを継続的に処理させることが出来ないため、フラグを変更
PlaygroundPage.current.needsIndefiniteExecution = true



//ワット数を選択できる enumとswhichのコンビを活用
enum Wattage{
    case wat500w
    case wat600w
    case wat700w
    
    //「ワット数をprintで表示する」ためにコンピューティッドプロパティを定義する
    var wattagePower: String {
        switch self {
        case .wat500w:
            return "500w"
        case .wat600w:
            return "600w"
        case .wat700w:
            return "700w"
        }
    }
}


class Alarm {
    var timer: Timer?
    var time = (min:0,sec:0)
    var limit: Int = 0
    
    init(min:Int, sec:Int){
        self.time.min = min
        self.time.sec = sec
    }
    
    func start(w: Wattage) {
        //minが10分より短ければ温める
        //minが11分以上ならカウント停止
        //選択したW数が表示される
        //タイマーが0分0秒の時もタイマーがスタートしてしまうので、0分0秒時はタイマーをスタートできないようにする
        if time.min <= 0 && time.sec <= 0 {
            print("タイマーを正常な値に設定してください")
            return
        }
                
        if time.min < 0 || time.sec < 0 {
            print("譜の数は設定できません")
            return
        }
        
        //タイマーが10分以上であればreturn
        if time.min >= 10, time.sec >= 1 {
            print("10分以内で設定してください")
            return
        }
        
        print("\(time.min)分\(time.sec)秒でタイマーがセットされました")
        print("\(w.wattagePower)で温めスタート")
        
        //任意の箇所でTimerクラスを使用して1秒毎にcountup()メソッドを実行させるタイマーをセット
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定(単位はn秒)
            target: self, // ここは「self」でOK
            selector: #selector(countdown), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
    }
    
    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countdown() {
        // タイマーを1秒ずつ減らす
        if time.min < 10 && time.sec > 0 {
            time.sec -= 1
            print("残り\(time.min)分\(time.sec)秒です")
        }
        //secが0になった判定
        if  time.min > 0 && time.sec == 0 {
            time.sec = 59
            time.min -= 1
            print("残り\(time.min)分\(time.sec)秒です")
        }
        
        // countの値がlimitの値以上になったif文を実行
        if limit == time.min, limit == time.sec {
        print("ピピピ")
            // タイマーを止める
            timer?.invalidate()
        }
    }
}

let alarm = Alarm(min: 0, sec: 10)
alarm.start(w: .wat700w)

