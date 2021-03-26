import UIKit

// Closure + func

func greeting(name: String) -> String{
    return "hi " + name
}

greeting(name: "jin")

//클로저 기본형
//{ (<#parameters#>) -> <#return type#> in
//    <#statements#>
//}

//return 타입 클로저 | func과의 차이점: 이름이 없다 => 실행시 ()만 붙이면 실행된다.
func greetingClosure(name: String) -> () -> String{
    return { /*return*/ "hi " + name}
}
greetingClosure(name: "minho")()    //()한번 더 붙이는 이유: 클로저도 func과 흡사하다 return값이 func이라고 생각



