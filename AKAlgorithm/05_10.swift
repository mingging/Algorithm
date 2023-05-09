//
//  05_10.swift
//  AKAlgorithm
//
//  Created by milli on 2023/05/09.
//

import Foundation

/// N이 주어졌을 때, 제일 마지막에 남게 되는 카드를 구하시오
func b2164() {
    /// N을 입력받는다.
    let n = Int(readLine()!)!
    
    /// 1부터 N까지의 번호가 있다.
    var numbers: [String] = []
    var indexFirst = 0
    var firstNumber: String = ""
    
    for i in 1...n {
        numbers.append("\(i)")
    }
    
    /// 아래 내용을 마지막 하나가 남을 때까지 반복한다.
    /// index가 2 이하 일때까지만 반복한다.
    while numbers.count - indexFirst >= 2 {
        
        /// 제일 위에 있는 카드를 바닥에 버린다.
        numbers[indexFirst] = ""
        
        print(indexFirst)
        print(numbers.count)
        
        /// 첫번째 카드를 저장해두고 해당 위치도 비워준다.
        firstNumber = numbers[indexFirst + 1]
        numbers[indexFirst + 1] = ""
        
        /// 제일 위에 있는 카드를 제일 아래에 있는 카드 밑으로 옮긴다.
        numbers.append(firstNumber)
        
        indexFirst += 2
        
        print(numbers)
    }
    
    print(numbers[numbers.count - 1])
}
