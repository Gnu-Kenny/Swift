# 상속 (Inheritance)

> 출처: https://jusung.gitbook.io/the-swift-language-guide/language-guide/13-inheritance

<br>

자식 클래스가 부모 쿨래스의 필드나 메소드를 그대로 받아서 사용할 수 있게 해주는 객체 지향 프로그래밍의 특징 중 하나입니다.

## 기반 클래스 정의 (Defining a Base Class)

---

`다른 어떤 클래스로부터도 상속받지 않은 클래스`

> NOTE
> Objective-C에서는 모든 클래스가 NSObject클래스로부터 파생된 클래스로 생성되는 것과 달리 Swift에서는 SuperClass 지정없이 클래스 선언이 가능하고 그 클래스가 SuperClass가 됩니다.

<br>

## 서브 클래싱 (Subclassing)

---

`부모로부터 성격을 상속받고 자기 자신 고유의 특성을 추가하는 것. `

<br>

서브클래싱해 새 클래스를 선언하는 코드

```swift
class SomeSubclass: SomeSuperclass {
    // subclass definition goes here
}
```

<br>

탈것이라는 클래스를 서브클래싱해 자전거라는 클래스를 선언하면

```swift
class Bicycle: Vehicle {
    var hasBasket = false
}
```

<br>

## 오버라이딩 (Overriding)

---

`서브클래스에서는 부모클래스에서 상속받은 것을 재정의 할 수 있습니다.`

##

<br>

## 부모클래스의 메소드, 프로퍼티, 서브스크립트의 접근

---

`super`키워드와 점문법 혹은 인덱스 구문으로 부모 클래스의 메소드, 프로퍼티, 서브스크립트에 접근할 수 있습니다.

- `super.someMethod`, `super.someProperty`, `super[someIndex]`

<br>

## 오버라이드 방지 (Preventing Overrides)

---

서브클래스에서 특정 메소드, 프로퍼티, 서브스크립트가 오버라이드 되는 것을 방지하려면 `final`키워드를 사용합니다.
