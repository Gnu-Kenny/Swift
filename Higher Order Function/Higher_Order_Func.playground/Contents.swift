import UIKit

// Higher Order Function

// map
var numberArray = [2,3,6,4,1]
let mapped = numberArray.map{ $0 * 10 }
print(mapped)

let stringArray = ["lee", "june", "kim"]
let mappedString = stringArray.map{ $0.uppercased()}
print(mappedString)

//compact map
let someArray: [Any] = [2,3,4, "kim", "jin"]
let compactMapped = someArray.compactMap{ $0 as? Int } //Int 타입으로 가져올수 있냐

print(compactMapped)

//filter
let over3 = numberArray.filter{$0 > 3}
print(over3)

//reduce
//numberArray.reduce(0) {(value1,value2) -> Int in
//    return value1 + value2
//}
let reduceResult = numberArray.reduce(0) { $0 + $1 }
print(reduceResult)

let reduceResultString = stringArray.reduce("", {$0 + $1})
print(reduceResultString)

// sort
// 그냥 sort는 해당되는 값 자체를 정렬시키겠다. 근데 현재 numberArray가 let으로
// 정의되어 있기 때문에 Error 발생한다.
numberArray.sort()
//by: > 큰 수에서 작은 수로
numberArray.sorted(by: > )
print(numberArray)

let sorted = numberArray.sorted()
print(sorted) //원래 값에 영향을 주지 않음
print(numberArray)
 
 
