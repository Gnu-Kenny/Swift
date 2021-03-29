# 초기화 (Initialization)

> 출처: https://jusung.gitbook.io/the-swift-language-guide/language-guide/14-initialization

<br>

- 초기화는 클래스, 구조체, 열거형 인스턴스를 사용하기 위해 준비 작업을 하는 단계 입니다.
- 이 단계에서 각 저장 프로퍼티의 초기 값을 설정합니다.
- 초기화 과정은 initializer를 정의 하는 것으로 구현할 수 있습니다.
- Swift의 initializer는 값을 반환하지 않습니다.

## 저장 프로퍼티를 위한 초기값 설정(Setting Initial Values for Sotred Properties)

---

인스턴스의 저장 프로퍼티는 사용하기 전에 반드시 특정 값으로 초기화 돼야 합니다.

> NOTE  
> initializer에서 저장 프로퍼티에 값을 직접 설정하면 프로퍼티 옵저버가 호출되지 않고 값 할당이 수행됩니다.

<br>

가장 기본적인 형태

```swift
init() {
    // perform some initialization here
}
```

## 지정 초기자와 편리한 초기자 (Designated Initializers and Convenience Initializers)

---

`지정 초기자`는 클래스의 주(primary) 초기자입니다. 지정 초기자는 클래스의 모든 프로퍼티를 초기화 합니다. 클래스 타입은 반드시 한개 이상의
지정 초기자가 있어야 합니다.

<br>

`편리한 초기자`는 초기화 단계에서 미리 지정된 값을 사용해서 최소한의 입력으로 초기화를 할 수 있도록 해주는 초기자입니다. _편리한 초기자 내에서 반드시 지정 초기자가 호출돼야 합니다._

<br>
<br>

### 지정 초기자와 편리한 초기자의 문법 (Syntax for Designated and Convenience Initializers)

지정 초기자

```swift
init(parameters) {
    statements
}
```

<br>

핀리한 초기자

```swift
convenience init(parameters) {
    statements
}
```

<br>
<br>

### **클래스 타입을 위한 이니셜라이저 위임 (Initializer Delegation for Class types)**

- 지정 초기자는 반드시 위임을 superclass로 해야 합니다.
- 편리한 초기자는 반드시 위임을 같은 레벨에서 해야 합니다.

![Initializer](https://gblobscdn.gitbook.com/assets%2F-LKLx6PA5iF3Uq2IzQsf%2F-LKMOdxAUIDQvKMGnBHo%2F-LKMP6nuRqkg023VFBxL%2FinitializerDelegation01_2x.png?alt=media&token=51e30fbd-596b-4989-a71b-3e3c62562192)

<br>
<br>

## 클로저나 함수를 이용해 기본 프로퍼티 값을 설정하기 (Setting a Default Property Value with a Closure or Function)

---

기본값을 지정하기 위해 클로저를 사용하는 형태의 코드는 보통 다음과 같습니다.

```swift
class SomeClass {
    let someProperty: SomeType = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return someValue
    }()
}
```

someProperty는 클로저가 실행된 후 반환 타입이 SomeType인 SomeValue를 기본 값으로 갖게 됩니다.

<br>

> NOTE  
> 클로저를 초기자에서 사용하면 클로저 안에 self나 다른 프로퍼티를 사용할 수 없습니다. 그 이유는 클로저가 실행될 시점에 다른 프로퍼티는 초기화가 다 끝난 것이 아니기 때문입니다.
