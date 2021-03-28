# 서브스크립트 (Subscripts)

> 출처: https://jusung.gitbook.io/the-swift-language-guide/language-guide/12-subscripts  
> 클래스, 구조체 그리고 열거형에서 스크립트를 정의해 사용할 수 있습니다.  
> \*서브스크립트: 콜렉션, 리스트, 시퀀스 등 집합의 특정 멤버 엘리먼트에 간단하게 접근할 수 있는 문법

<br>

## 서브스크립트 문법 (Subscripts Syntax)

---

Computed Properties 선언과 비슷하나, Subscripts는 **읽고-쓰기**(read-write) 혹은 **읽기 전용**(read only)만 가능합니다.  
정의는 `setter`, `getter` 방식을 따릅니다.

```swift
subscript(index: Int) -> Int {
    get {
        // 적절한 반환 값
    }
    set(newValue) {
        // 적절한 set 액션
    }
}
```

<br>

`set` 에 대한 인자값을 지정하지 않으면 default value로 `newValue`를 사용합니다. `get` , `set`을 지우고 따로 지정하지 않으면 `get`으로 동작하게 되어 read only로 선언됩니다.

```swift
subscript(index: Int) -> Int {
    // 적절한 반환 값
}
```

<br>

read only Example

```swift
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// "six times three is 18" 출력
// 변수명'[index]' -> subscript의 인자 'index'로 이어진다.
```

## 서브스크립트 사용 (Subscripts Usage)

---

Dictionary Example
