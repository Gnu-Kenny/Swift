import UIKit

//Closures
//특정한 기능을 실행하게 하는 묶음 / func과 비슷
//실행할 코드 블록을 다른 곳으로 전달시킬수도 있음.
func sayHi(firstName: String, lastName: String) -> String {
    return "\(firstName + lastName) Hello1"

}
//closure은 기본적으로 이름이 없기때문에 함수처럼 그냥 두면 Error 따라서 변수에 다 저장하는 식으로 저장
//var sayHi = { (<#parameters#>) -> <#return type#> in
//    <#statements#>
//}

var sayGreet = { (firstName: String, lastName:String) -> String in
    return "\(firstName + lastName) Hello2"
    
}
//Type Inference (타입 추론) return의 타입을 보고 자동으로 캐스팅해서 return 자료형을 생략해줄수 있다.
var sayGreet2 = { (firstName: String, lastName:String)  in
    return "\(firstName + lastName) Hello2"
    
}
//Implicit Returns (암시적 반환) from Single-express closure : return 생략 ==> statement가 한줄일경우 return 값으로 인식한다.
var sayGreet3 = { (firstName: String, lastName:String)  in
    //let myNumber = 10
    "\(firstName + lastName) Hello3"
    
}


var sayGreet4: (String, String) -> String = { (firstName, lastName)  in
    //let myNumber = 10
    "\(firstName + lastName) Hello4"
    
}
//Shortend Arguments Names (인자이름 축약)
var sayGreet5: (String, String) -> String = { $0 + "dd" + $1 } //{return $0 + $1}

print(sayHi(firstName: "jin", lastName: "Hee"))
print(sayGreet("jin","park"))
print(sayGreet2("jin","park"))
print(sayGreet3("jin","park"))
print(sayGreet4("jin","park"))
print(sayGreet5("j","h"))
