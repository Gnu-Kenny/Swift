import UIKit

//Initialization
//초기화

//인스턴스 생성

class Score {
    var homeTeamScore: Int?  //이런 형태를 property라고 함
    var awayTeamScore: Int?
    
    func totalScore() -> Int{
        return homeTeamScore! + awayTeamScore!
    }
//    init() {    //인스턴스 생성시 자동 실행됨. 생성자와 같음 | 프로퍼티가 옵셔널이기 때문에 initialization이 필수가 아님
//        homeTeamScore = 5
//        awayTeamScore = 5
//    }
}

struct ScoreStruct {
    var homeTeamScore: Int  //이런 형태를 property라고 함
    var awayTeamScore: Int
    
    func totalScore() -> Int{
        return homeTeamScore + awayTeamScore
    }
    init() {    //인스턴스 생성시 자동 실행됨. 생성자와 같음
        homeTeamScore = 5
        awayTeamScore = 5
    }
}

//인스턴스 생성
var sss = ScoreStruct()
sss.awayTeamScore
sss.homeTeamScore
//인스턴스 생성
var ss = Score() //initialize 하겠다 == 메모리에 띄워 놓겠다.
ss.awayTeamScore
ss.homeTeamScore
