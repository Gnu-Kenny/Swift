# 옵셔널 체이닝 (Optional Chaining)

> 출처: https://jusung.gitbook.io/the-swift-language-guide/language-guide/16-optional-chaining  
> 출처: https://xho95.github.io/swift/language/grammar/error/handling/2020/06/17/Optional-Chaining.html

### 옵셔널 체이닝은 nil일 수도 있는 프로퍼티나, 메소드 그리고 서브스크립트에 질의(query)를하는 과정을 말합니다.

여러 질의를 연결해서 할 수도 있는데, 연결된 질의에서 어느 하나라도 nil이면 전체 결과는 nil이 됩니다.

## 강제 언래핑의 대체로써의 옵셔널 체이닝 (Optional Chaining as an Alternative to Forced Unwrapping)

---

강제 언래핑과의 차이점:  
강제 언레핑을 했는데 만약 그 값이 없으면 런타임 에러가 발생하지만, 옵셔널 체이닝을 사용하면 런타임 에러 대신 nil이 반환 됩니다.

<br>

## 옵셔널 체이닝을 위한 모델 클래스 정의 (Defining Model Classes for Optional Chaining)

---

해당 주제 설명을 위해 먼저 4가지 클래스를 정의해보겠습니다.

```swift
class Person {
  var residence: Residence?
}
```

```swift
class Residence {
    var rooms = [Room]()  ////타입이 Room인 배열 rooms 생성
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {  //rooms 배열을 접근하기 위한 서브스크립트 선언
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
```

```swift
class Room {
    let name: String
    init(name: String) { self.name = name }
}
```

```swift
class Address {
    // 빌딩 주소를 구분하는 대체 수단
    var buildingName: String?
    var buildingNumber: String?
    // 거리의 주소를 나타냄
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
```

<br>
<br>

## 옵셔널 체이닝을 통한 프로퍼티의 접근 (Accessing Properties Through Optional Chaining)

---

옵셔널 체이닝을 이용해 프로퍼티에 접근할 수 있습니다.

```swift
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."
```

위 코드의 경우 residence?가 nil이기 때문에 옵셔널 체이닝 결과 nil을 호출하게 됩니다. 옵셔널 체이닝을 값을 할당하는데 사용할 수도 있습니다.

<br>
<br>

## 옵셔널 체이닝을 통한 서브스크립트 접근 (Accessing Subscripts Through Optional Chaining)

---

옵셔널 체이닝을 이용해 옵셔널 값을 서브스크립트로 접근할 수 있습니다.

<br>

> NOTE  
> 옵셔널 값을 서브스크립트로 접근 하기 위해서는 [] 괄호 전에 물음표(?) 기호를 붙여서 사용합니다.

<br>

아래 예제는 서브스크립트를 이용해 rooms에서 첫 rooms의 name을 요청하는 코드입니다. 현재 john.residence가 nil이기 때문에 서브스크립트 접근은 실패합니다.

```swift
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
```

<br>

옵셔널 체이닝에서 서브스크립트로 값을 가져오는 것과 유사한 형태로 값을 할당할 수 있습니다. `john.residence?[0] = Room(name: "Bathroom")` 이 코드는 첫 room 값을 할당하는 코드인데 room을 할당 하지 못하고 fail이 발생합니다. 이유는 **residence가 현재 nil이기 때문** 입니다.

따라서 해당 Residence 인스턴스 하기 위해선 residence 서브스크립트를 사용해야합니다.

```swift
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room")) //배열 각각의 element의 타입이 Room
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

 if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."
```

<br>
<br>

## 옵셔널 타입의 서브스크립트 접근 (Accessing Subscripts of Optional Type)

---

만약 Swift의 사전 타입(Dictionary Type)같이 서브스크립트의 결과로 옵셔널을 반환 한다면 그 뒤에 물음표(?)를 붙여 줍니다. 사전 타입은 key-value로 동작하기 때문에 항상 그 사전에 key가 존재한다는 보장이 없기 때문에 옵셔널 값을 반환합니다.

<br>

```swift
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
```

위 예제는 testScores라는 사전에서 특정 key에 대한 값을 get 혹은 set하는 코드입니다. Dave, Bev와 관련한 값은 처리가 되고 Brian은 등록된 key가 없기 때문에 관련한 아무런 일도 처리도 일어나지 않습니다.
