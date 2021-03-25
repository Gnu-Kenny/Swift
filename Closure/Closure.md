# Closure

> 클로저 (Closure)는 코드블럭으로 다른 언어의 람다(lambdas)와 비슷 합니다.  
> 클로저는 어떤 상수나 변수의 참조를 캡쳐(capture)해 저장할 수 있습니다. Swift는 이 캡쳐와 관련한  
> 모든 메모리를 알아서 처리합니다.

<br>

## 클로저는 다음 세 가지 형태 중 하나를 갖는다.

- **전역 함수** : 이름이 있고 어떤 값도 캡쳐하지 않는 클로저
- **중첩 함수** : 이름이 있고 관련한 함수로 부터 값을 캡쳐 할 수 있는 클로저
- **클로저 표현** : 경량화 된 문법으로 쓰여지고 관련된 문맥(context)으로부터 값을 캡쳐할 수 있는 이름이 없는 클로저
  <br>
  <br>
  <br>

## 클로저 표현 문법

<br>

### **일반적인 형태**

---

```swift
{
    (parameters) -> return type in
    statements
}
```

인자로 넣을 parameters, 인자 값으로 처리할 내용을 기술하는 statements 그리고 return type입니다.  
예) 내림차순 정렬을 클로저로 표현한 코드

```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

이렇게 함수로 따로 정의된 형태가 아닌 인자로 들어가 있는 형태의 클로저를 **인라인 클로저** 라 부릅니다. 클로저의 몸통(body)은 in 키워드 다음에 시작합니다.
<br>
<br>

### **문맥에서 타입 추론 (Inferring Type From Context)**

---

sorted(by:)의 메소드에서 이미 (String, String) -> Bool 타입의 인자가 들어와야 하는지 알기 때문에  
클로저에서 이 타입들은 생략 될 수 있습니다.
<br>
<br>

```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

<br>

### **단일 표현 클로저에서의 암시적 반환 (Implicit Returns from Single-Express Closures)**

---

단일 표현 클로저에서는 반환 키워드를 생략할 수 있습니다.

<br>

```swift
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```

<br>

### **인자 이름 축약 (Shorthand Arguments Names)**

---

축약 인자 이름을 사용하면 인자 값과 그 인자로 처리할 때 사용하는 인자가 같다는 것을 알기 때문에

인자를 입력 받는 부분과 in 키워드 부분을 생략 할 수 있습니다.

<br>

```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

<br>

### **연산자 메소드 (Operator Methods)**

Swift의 String 타입 연산자에는 String끼리 비교할 수 있는 비교 연산자(>) 를 구현해 두었습니다.  
 이 때문에 그냥 이 연산자를 사용하면 됩니다.

```swift
reversedNames = names.sorted(by: >)
```

## 후위 클로저

---

<br>
만약 함수의 마지막 인자로 클로저를 넣고 그 클로저가 길다면 후위 클로저를 사용할 수 있습니다.   
이런 형태의 함수와 클로저가 있다면

```swift
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
```

<br>
위 클로저의 인자 값 입력 부분과 반환 형 부분을 생략해 다음과 같이 표현할 수 있고

```swift
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
```

<br>

이것을 후위 클로저로 표현하면 아래와 같이 표현할 수 있습니다. 함수를 대괄호 ( {, } )로 묶어  
그 안에 처리할 내용을 적으면 됩니다. 모르고 사용하셨다면 이런 일반적인 전역함수 형태가 사실 클로저를  
사용하고 있던 것이었습니다. 😉

```swift
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
```

<br>
앞의 정렬 예제를 후위 클로저를 이용해 표현하면 이렇게 표현할 수 있습니다.

```swift
reversedNames = names.sorted() { $0 > $1 }
```

<br>
만약 함수의 마지막 인자가 클로저이고 후위 클로저를 사용하면 괄호()를 생략할 수 있습니다.

```swift
reversedNames = names.sorted { $0 > $1 }
```

이번에는 후위 클로저를 이용해 숫자(Int)를 문자(String)로 매핑(Mapping)하는 예제를 살펴 보겠습니다.  
다음과 같은 문자와 숫자가 있습니다.

```swift
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
```

이 값을 배열의 map(\_:)메소드를 이용해 특정 값을 다른 특정 값으로 매핑하는 할 수 있는 클로저를 구현합니다.

```swift
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
    // let strings는 타입 추론에 의해 문자 배열([String])타입을 갖습니다.
    // 결과는 숫자가 문자로 바뀐 ["OneSix", "FiveEight", "FiveOneZero"]가 됩니다.

}
```

<br>
위 코드는 각 자리수를 구해서 그 자리수를 문자로 변환하고, 10으로 나눠서 자리수를 바꾸며 문자로 변환하는 것을    
반복합니다. 이 과정을 통해 숫자 배열을, 문자 배열로 바꿀 수 있습니다. number값은 상수인데, 이 상수 값을    
클로저 안에서 변수 var로 재정의 했기 때문에 number값의 변환이 가능합니다. 기본적으로 함수와 클로저에 넘겨지는    
인자 값은 상수입니다.

> digitNames[number % 10]!에 뒤에 느낌표(!)가 붙어있는 것은 사전(dictionary)의 subscript는
> 옵셔널이기 때문입니다. 즉, 사전에서 특정 key에 대한 값은 있을 수도 있고 없을 수도 있기 때문에 논리적으로 당연한 일입니다.
