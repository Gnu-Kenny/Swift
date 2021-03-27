import UIKit

//Generic
//타입을 사용할때 정의할 수 있다.

var intValue: Int = 5
var doubleValue: Double = 5.5
var floatValue: Float = 3.4

func plus(a: Int, b: Int) -> Int{
    return a + b
}

plus(a:intValue, b:intValue)

//function에 generic 사용 형태 <T>
//Numeric : 숫자를 아울러 표현
func plusGeneric<T: Numeric>(a: T,b: T) -> T{
    return a + b
}

var result = plusGeneric(a: doubleValue, b: doubleValue)

