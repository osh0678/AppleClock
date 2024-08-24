//
//  String+Korean.swift
//  AppleClock
//
//  Created by seong on 8/23/24.
//

import Foundation

extension String {
    //초성
    var initConst: String? {
        guard trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
            return nil
        }
        
        guard let firstChar = first, let unicodeScalar = UnicodeScalar(String(firstChar))
        else {
            return nil
        }
        
        //unicode 한글 범위
        guard (0xAC00 ... 0xD7AF).contains(unicodeScalar.value) else {
            return String(firstChar)
        }
        
        let initConstList = ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
        let initConstIndex = (unicodeScalar.value - 0xAC00) / (21 * 28)
        
        return initConstList[Int(initConstIndex)]
    }

}
