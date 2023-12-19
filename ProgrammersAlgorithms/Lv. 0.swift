//
//  Lv. 0.swift
//  ProgrammersAlgorithms
//
//  Created by min on 2023/11/28.
//

import Foundation

// 문자 리스트를 문자열로 변환하기 Lv. 0
func solution_181941(_ arr:[String]) -> String {
    return arr.joined()
}

// 콜라츠 수열 만들기 Lv. 0
func solution_181919(_ n:Int) -> [Int] {
    
    var lastNumber: Int = n
    var numberArr: [Int] = []
    
    numberArr.append(n)
    
    // 1이 될때까지 반복하기
    while lastNumber > 1 {
        // n이 짝수면 2로 나눈다.
        if lastNumber % 2 == 0 {
            lastNumber = lastNumber / 2
        } else {
            // n이 짝수가 아니면 3 * n + 1 로 바꾼다.
            lastNumber = 3 * lastNumber + 1
        }
        
        numberArr.append(lastNumber)
    }
    
    return numberArr
}

// 글자 이어 붙여 문자열 만들기
func solution_181915(_ my_string:String, _ index_list:[Int]) -> String {
    // 문자열 my_string 과 인덱스 배열 index_list 가 주어진다.
    
    // 각 인덱스에 해당하는 문자열을 골라 출력해라
    var result: String = ""
    
    // 문자열을 먼저 배열로 만든다.
    let stringArray = my_string.map { String($0) }
    
    // 인덱스에 맞는 문자열을 하나씩 뽑아낸다.
//    for i in 0..<index_list.count {
//        for j in 0..<stringArray.count {
//            if index_list[i] == j {
//                result += stringArray[j]
//                break
//            } else {
//                continue
//            }
//        }
//    }
    
    for i in 0..<index_list.count {
        result += stringArray[index_list[i]]
    }
    
    
    
    return result
}

func solution_181907(_ my_string: String, _ n: Int) -> String {
    
    return "\(my_string.prefix(n))"
}
