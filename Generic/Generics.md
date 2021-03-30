# 지네릭 (Generic)

> 출처: https://xho95.github.io/swift/language/grammar/tour/2016/04/17/A-Swift-Tour.html  
> 출처:https://jusung.gitbook.io/the-swift-language-guide/language-guide/22-generics

지네릭은 더 유연하고 재사용 가능한 함수와 타입의 코드를 작성하는 것을 가능하게 해 줍니다.

‘꺽쇠 괄호 (angle brackets)’ 안에 이름을 작성하여 ‘일반화한 (generic) 함수’ 나 ‘일반화한 (generic) 타입’ 을 만듭니다.

<br>

```swift
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
  var result = [Item]()
  for _ in 0..<numberOfTimes {
    result.append(item)
  }
  return result
}
makeArray(repeating: "knock", numberOfTimes:4)
```

<br>

클래스, 열거체, 그리고 구조체 뿐만 아니라, 함수와 메소드의 ‘일반화 형식 (generic forms)’ 도 만들 수 있습니다.

```swift
// 스위프트 표준 라이브러리의 옵셔널 타입을 재구현함
enum OptionalValue<Wrapped> {
  case none
  case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
```
