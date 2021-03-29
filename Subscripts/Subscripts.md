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

```swift
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
```

<br>

`numberOfLegs`값은 타입 추론에 의해 `[String: Int]`형을 갖습니다. `numberOfLegs["bird"] = 2`는 사전형 변수 `numberOfLegs`에 key로 bird를 그 값은 2를 넣으라는 서브스크립트 문법입니다.

> NOTE  
> 사전의 반환 값은 옵셔널입니다. 그 이유는 사전에 특정 키 값이 없는 경우가 있을 수 있고, 특정 키 값을 nil로 설정할 수 있기 때문입니다.

<br>

## 서브스크립트 옵션 (Subscript Options)

- 서브스크립트는 입력 인자의 숫자에 제한이 없고, 입력 인자의 타입과 반환 타입의 제한도 없습니다.
- in-out 인자(in-out parameter)나 기본 인ß자 값(default parameter value)을 제공할 수는 없습니다.
- 서브스크립트는 오버로딩도 허용합니다. 그래서 인자형, 반환형에 따라 원하는 수 만큼의 서브스크립트를 선언할 수 있습니다.

<br>

```swift
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
```

- 위 코드에서는 subscript(row: Int, column: Int) -> Double코드와 같이 row, column 2개의 인자를 받고, Double를 반환하는 서브스크립트를 선언했습니다.
- get, set 각각에 indexIsValid메소드를 사용해서 유효한 인덱스가 아닌경우 프로그램이 바로 종료 되도록 assert를 호출했습니다.
- 선언한 서브스크립트 문법을 이용해 var matrix = Matrix(rows: 2, columns: 2) 2 x 2 행렬을 선언합니다.

<br>

```swift
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
```

값을 넣은 결과 행렬은 다음과 같은 모습이 됩니다.

<br>

![Subscripts_Matrix](https://gblobscdn.gitbook.com/assets%2F-LKLx6PA5iF3Uq2IzQsf%2F-LKMNVThMs-6OciUjtgW%2F-LKMNoEZxJZygWqCLkZp%2FBE27D61E-5730-4155-B132-ED1A14038787.png?alt=media&token=52c94ff7-b995-4a97-b1bf-3415e91b7ada)
