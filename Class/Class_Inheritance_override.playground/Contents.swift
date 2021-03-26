import UIKit

//Class
//참조한다. 값을 복사하지 않는다. <-> array 값을 복사함

//struct myDesk {
//    var a = 10
//    func Test(){
//
//    }
//}



//class Soccer {
//    var homeScore = 0
//    var awayScore = 0
//
//    func result() -> String {
//        return "\(homeScore)" + " : " + "\(awayScore)"
//    }
//}
//
//var soccer = Soccer()
//
//soccer.result()
//
//class Baseball {
//    var homeScore = 0
//    var awayScore = 0
//    func result() -> String {
//        return "\(homeScore)" + " : " + "\(awayScore)"
//    }
//}
//
//class Football {
//    var homeScore = 0
//    var awayScore = 0
//    func result() -> String {
//        return "\(homeScore)" + " : " + "\(awayScore)"
//    }
//
//}


class ScoreBoard {
    var homeScore = 0
    var awayScore = 0
    func result() -> String {
        return "\(homeScore)" + " : " + "\(awayScore)"
    }
}
// 상속
class Tennis: ScoreBoard {
    
}
class Soccer: ScoreBoard {
    //정의하려는 메소드가 부모 클래스에 있다면 override가 자동 입력된다.
    //override 새로 만든다.
    override func result() -> String {
        return "\(homeScore)" + " - " + "\(awayScore)"
    }
}
class BaseBall: ScoreBoard{
    
}
var tennis = Tennis()
tennis.awayScore = 6
tennis.homeScore = 15
tennis.result()

var soccer = Soccer()
soccer.homeScore = 4
soccer.awayScore = 3
soccer.result()

var soccer2 = soccer    //참조가 된다. =>
soccer2.homeScore = 10
soccer.homeScore

// override

// 참조  같은 주소의 값을 바라봄.
// 값 복사

