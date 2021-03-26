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

