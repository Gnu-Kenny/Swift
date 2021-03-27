import UIKit

// Protocol
// 프로토콜

// 특정한 조건을 강제하고 싶을 때 사용
// 콜백할때 사용
//프로토콜은 반드시 구현해야하는 요소가 있다 | 옵셔널이 아닌 것
//class MyClass: UIViewController, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
//}

protocol DeskMaterial {
    var top: String{ get set }
    var middle: String { get set }
    
}

//stored properties XXX
protocol DeskSize {
    var width: Int { get set }
    var height: Int { get set }
    func area() -> Int
}

protocol DeskInfo: DeskSize, DeskMaterial {
    
}

// 정의한 프로퍼티는 반드시 구현해야한다.

class MyClass: DeskSize,DeskMaterial {
    var top: String = ""
    
    var middle: String = ""
    
    var width: Int = 0
    var height: Int = 0
    func area() -> Int {
        return width * height
    }
}
 
var myClass = MyClass()
myClass.width = 20
myClass.height = 30
myClass.area()

