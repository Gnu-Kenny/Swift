# Error Handling (에러 처리)

> 출처: https://xho95.github.io/swift/language/grammar/tour/2016/04/17/A-Swift-Tour.html  
> 출처: https://jusung.gitbook.io/the-swift-language-guide/language-guide/17-error-handling

<br>

에러는 Error 프로토콜을 '채택한 (adopt)' 어떤 타입으로 표현합니다.

```swift
enum PrinterError: Error {
  case outOfPaper
  case noToner
  case onFire
}
```

<br>

## 에러를 발생시키는 함수 사용하기(Propagating Errors Using Throwing Functions)

---

<br>

에러를 발생시키기 위해 `throw` 구문을 사용할 수 있습니다.

```swift
func send(job: Int, toPrinter printerName: String) throws -> String {
  if printerName == "Never Has Toner" {
    throw PrinterError.noToner
  }
  return "Job sent"
}
```

- `throws`을 통해 에러를 발생 시킬 수 있는 함수를 표시합니다.
- 함수에서 에러를 발생시키면, 함수는 즉시 반환하며 함수를 호출한 코드가 에러를 처리합니다.

<br>

## 다양한 에러 처리 방법 (Various types of Method of Error Handling)

---

<br>

에러 처리에는 여러 가지 방법이 있습니다.

1. **do-catch 문**  
   do 블럭 내에서, 에러를 던질 수 있는 코드는 그 앞에 try 를 써서 표시합니다. catch 블럭 내에서, 에러는 다른 이름을 부여하지 않는 이상 자동으로 error 라는 이름을 부여합니다.

```swift
do {
  let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
  print(printerResponse)
} catch {
  print(error)
}
// "Job sent" 를 인쇄합니다.
```

<br>

2. **다중 catch 블럭**  
   ‘switch 문’ 의 case 절 뒤에 하는 것처럼 catch 절 뒤에 ‘유형 (pattern; 패턴)’ 을 작성합니다.

```swift
do {
  let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
  print(printerResponse)
} catch PrinterError.onFire {
  print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
  print("Printer error: \(printerError).")
} catch {
  print(error)
}
// "Job sent" 를 인쇄합니다.
```

<br>

3. **try? 사용**  
   `try?` 를 사용하여 결과를 옵셔널로 변환하는 것입니다. 함수가 에러를 발생시키면 지정된 에러를 버리고 결과는 nil 이 됩니다. 다른 경우, 결과는 함수가 반환한 값을 담은 옵셔널이 됩니다.

```swift
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
```

4. **defer 사용**

- defer 를 사용하여 작성한 코드는, 함수 반환 바로 직전에, 함수에 있는 모든 다른 코드 다음에 실행됩니다.
- 함수가 에러를 발생시키더라도 이에 상관없이 실행됩니다.
- 서로 다른 시간에 실행되어야 하는, ‘설정 (setup) 코드’ 와 ‘정리 (cleanup) 코드’ 도 서로 나란하게 작성할 수 있습니다.

```swift
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
  fridgeIsOpen = true
  defer {
    fridgeIsOpen = false
  }

  let result = fridgeContent.contains(food)
  return result
}
fridgeContains("banana")
print(fridgeIsOpen)
// "false" 를 인쇄합니다.
```
