import UIKit

//Extension
//익스텐션
//기존의 class 나 struct에 추가적인 기능을 넣고 싶을때 사용
//전반적으로 넣고 싶은 기능
//편리성을 제공

//구현 형태
extension String {
    
}
 
// 색깔 지정
// 메인 컬러 -
// 서브 컬러 -
// 텍스트 메인 타이틀 -
// 텍스트 상세 -

//제약 조건 : stored property   XXX
//매번 컬러 지정을 하는게 번거롭다.
extension UIColor{
    var mainRedColor:UIColor{
        return UIColor(red: 240/255, green: 30/255, blue: 30/255, alpha: 1)
    }
    var subGreenColor: UIColor{
        return UIColor(red: 30/255, green: 240/255, blue: 30/255, alpha: 1)
    }
    
}
var titleColor: UIColor!
var descriptionColor: UIColor!

titleColor = UIColor(red: 240/255, green: 30/255, blue: 30/255, alpha: 1)
titleColor = UIColor().mainRedColor

descriptionColor = UIColor(red: 30/255, green: 240/255, blue: 30/255, alpha: 1)
descriptionColor = UIColor().subGreenColor
