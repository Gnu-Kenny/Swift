import UIKit

//Closure Expert

var names = ["apple", "lemon", "brown", "red", "band", "candy", "air"]

//filter a로 시작, b로 시작

func filterString(datas: [String], firstString: String) -> [String]{
    var newDatas = [String]()
    for index in 0..<names.count{
        if datas[index].first?.description == firstString{
            newDatas.append(datas[index])
        }
    }
    return newDatas
}

filterString(datas: names, firstString: "a")
filterString(datas: names, firstString: "b")

//특정한 조건, 상태인 부분을 클로저라고 생각한다.
//String을 보고 맞으면 넣고 안넣으면 안넣는다.
//로직을 직접 쓰지 않고 로직에 대한 흐름만 집어 넣는다.
func filterStringClosure(datas: [String], closure:(String) -> Bool ) ->
    [String]{
    var newDatas = [String]()
    for data in datas{      //클로저가 파라미터에서 작동하도록 코드를 짜야됨.
        if closure(data) {
            newDatas.append(data)
        }
        
    }
    return newDatas
}
//이 filterStringClosure을 실제로 실행할때 로직을 직접 쓴다.
//실제로 func을 호출하는 부분에 조건을 쓴다.
let filtered = filterStringClosure(datas: names) { (element) -> Bool in
    if element.first?.description == "b"{
        return true
    }
    return false
}

//클로저를 이러한 형태로 만드는 이유
//실행하는 순간에 그 조건을 바로 확인하기 편하다.
//Func 형태의 경우 호출하는 순간에는 인자 밖에 볼수 없으므로 로직을 확인하기 힘들다.
// 클로저 단점: 로직을 한눈에 알아보기 쉽지 않을 수 있다. 하지만 눈에 익숙해지면 해결되는 단점임.

print(filtered)
//조건
var  findA: (String) -> Bool = { element /*(element) -> Bool */in
    if element.first?.description == "a" {
        return true
    }
    return false
}

var  findB: (String) -> Bool = { element /*(element) -> Bool */in
    if element.first?.description == "b" {
        return true
    }
    return false
}

//5글자인 것을 찾겠다.
var sringLength5: (String) -> Bool = { element /*(element) -> Bool */in
    if element.count == 5 {
        return true
    }
    return false
}
//func으로 짜려면 코드가 많이 바뀌게 된다.
//호출
filterStringClosure(datas: names, closure: findA)
filterStringClosure(datas: names, closure: findB)
filterStringClosure(datas: names, closure: sringLength5)

//func 호출 -> 프레임이 경직되어 있다. 특정한 조건을 받아 특정한 값을 출력해야하는 틀임. 조건 상상도 힘듬
filterString(datas: names, firstString: "a")
filterString(datas: names, firstString: "b")
