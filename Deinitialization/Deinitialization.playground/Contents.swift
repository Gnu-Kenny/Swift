import UIKit

//Deinitialization
//초기화 해제
class Score{
    //init때 해야할 작업을 쓰는 것
    init() {
        print("생성되는 시점에 호출")
    }

    deinit{
        print("소멸되는 시점에 호출")
    }

}


var myScore: Score? = Score()
//nil을 넣는다는 것의 의미 -> 소멸시키겠다. -> 값이 없는 상태를 허용하겠다 -> 옵셔널 타입
myScore = nil
