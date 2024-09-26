//
//  InitalizingDateModel.swift
//  Timoney
//
//  Created by 박준영 on 9/25/24.
//

import Foundation

@Observable
class InitalizingDateModel {
    var startDate: Date = .now
    var endDate: Date = (Calendar.current.date(byAdding: .month, value: 1, to: .now) ?? .now)
    var yourValue: String = ""
    var valueItem: String = ""
    
    var timeInterval: String {
        let time = Int(endDate.timeIntervalSince(startDate)) / 60 / 60 / 24
        return "\(time)"
    }
    
    var formattedYourValue: String {
        // yourValue가 비어있으면 빈 문자열 반환
        if yourValue.isEmpty {
            return ""
        }
        
        // 숫자로 변환 시도
        if let value = Int(yourValue) {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal // 3자리마다 콤마 추가
            numberFormatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
            
            if value < 10_000 {
                // 10,000 이하일 경우 그대로 원으로 표시
                if let formattedValue = numberFormatter.string(from: NSNumber(value: value)) {
                    return "\(formattedValue)원" // 원화 표시
                }
            } else if value < 1_000_000_000 {
                // 만 단위로 변환
                let valueInTenThousand = Double(value) / 10_000.0
                numberFormatter.minimumFractionDigits = 0 // 소수점 아래 0자리 이상
                numberFormatter.maximumFractionDigits = 1 // 소수점 아래 1자리 이상
                
                if let formattedValue = numberFormatter.string(from: NSNumber(value: valueInTenThousand)) {
                    return "\(formattedValue)만 원" // 만 단위로 표시
                }
            } else {
                // 억 단위로 변환
                let valueInHundredMillion = Double(value) / 1_000_000_000.0
                numberFormatter.minimumFractionDigits = 0 // 소수점 아래 0자리 이상
                numberFormatter.maximumFractionDigits = 1 // 소수점 아래 1자리 이상
                
                if let formattedValue = numberFormatter.string(from: NSNumber(value: valueInHundredMillion)) {
                    return "\(formattedValue)억 원" // 억 단위로 표시
                }
            }
        }
        // 숫자로 변환할 수 없는 경우 빈 문자열 반환
        return ""
    }
    
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
