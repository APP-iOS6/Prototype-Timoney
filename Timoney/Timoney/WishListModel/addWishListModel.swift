//
//  addWishListModel.swift
//  Timoney
//
//  Created by 박준영 on 9/24/24.
//

import Foundation

@Observable
class addWishList {
    var focused: Bool = false
    var nameField: String = ""
    var valueItem: String = ""
    var imageURL: String = ""
    
    var formattedValueItem: String {
        // valueItem이 비어있는지 확인
        if valueItem.isEmpty {
            return "" // 아무것도 입력되지 않으면 빈 문자열 반환
        }
        
        // valueItem을 숫자로 변환
        if let value = Int(valueItem) {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal // 3자리마다 쉼표 넣기
            numberFormatter.locale = Locale(identifier: "ko_KR") // 한국식 통화 단위
            if let formattedString = numberFormatter.string(from: NSNumber(value: value)) {
                return "\(formattedString) 원" // 원화 표시
            }
        } else {
            return "지원하지 않는 형식입니다" // 숫자가 아닌 경우
        }
        
        return valueItem
    }
}
