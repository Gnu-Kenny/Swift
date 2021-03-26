import UIKit

//Properties 프로퍼티

// Stored Properties - 저장 프로퍼티 : 값이 들어있거나 지정된 형식
//      ==> enum은 Stored Properties 형식을 가질 수 없다. swift 포맷상.
// Computed Properties - 계산 프로퍼티 : 원하는 로직을 넣은 형태 totalScore와 같은 포맷

//Class, struct는 computed properties 지정 가능

class SomeClass {
    var firstScore = 10
    var secondScore = 20
//    var totalScore = firstScore + secondScore     xxx
    var totalScore: Int{   //set 정의 없을 시 읽기 전용으로 생각 --get-only
        get{ //결과적으로 나오는 totalScore의 값
            return firstScore + secondScore
        }
//        set{ //입력할 totalScore 값
//
//        }
    }
}

var someClass = SomeClass()
//someClass.totalScore = 10     xxx  get-only이기 떄문 ==> 가능하려면 set 지정
someClass.firstScore = 50
someClass.secondScore = 100
someClass.totalScore



struct SomeStruct {
    var firstScore = 10
    var secondScore = 20
    var totalScore: Int{
        get{
            return firstScore + secondScore
        }
    }
}
var someStruct = SomeStruct()
//enum은 개별적으로 각각의 타입들에 대한 특정한 상태, 값을 나타낼 때 유용함
enum SomeEnum {
//    var score = 10    xxx
    case iPhone
    case iPad
    
    var price: Int{
        switch self { // self == enum안에 구현되어 있는내용
        case .iPad:
             return 500
            
        case .iPhone:
            return 400
            
//        default:
//            break
        }
    }
}


var someEnum = SomeEnum.iPad
someEnum.price

someEnum = .iPhone
someEnum.price

