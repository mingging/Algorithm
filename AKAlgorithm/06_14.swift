//
//  06_14.swift
//  AKAlgorithm
//
//  Created by min on 2023/06/13.
//

import Foundation


// 피보나치 비스무리한 수열
func b14495() {
    // 피보나치 비스무리한 수열은 f(n) = f(n-1) + f(n-3)인 수열이다
    // f(1) = f(2) = f(3) = 1
    // 9 + 7 == 16 + 3
    
    // 자연수 n을 입력받는다.
    let n = Int(readLine()!)!
    
    var result: UInt = 0
    var resultArray: [UInt] = [UInt](repeating: 1, count: 117)
    
    // 1 1 1 2 3 4 6 9 13 19
    // 1 1 1 2 3
    
    if n >= 3 {
        for i in 3...n {
            result = resultArray[i - 1] + resultArray[i - 3]
            resultArray[i] = result
        }
    }
    
    print(resultArray)
    print(resultArray[n - 1])
}

func test14495() {
    let n = Int(readLine()!)!

    var result: UInt = 0

    var resultArray: [UInt] = [UInt](repeating: 1, count: 117)

    if n >= 3 {
        for i in 3...n {
            result = resultArray[i - 1] + resultArray[i - 3]
            resultArray[i] = result
        }
    }
    
    print(resultArray[n-1])
}

// 1, 2, 3 더하기
func b9095() {
    
}

// 돌 게임
func b9655() {
    // 탁자 위에 돌 N개가 있다.
    let n = Int(readLine()!)!
    
    // 상근이와 창영이는 턴을 번갈아 가면서 돌은 1개 또는 3개 가져갈 수 있다.
    // 돌은 홀수개까지만 가져갈 수 있음
    // 상근이가 먼저 시작하기 때문에 돌이 홀수면 상근이에서 끝난다
    if n % 2 == 0 {
        // 짝수
        print("CY")
    } else {
        // 홀수
        print("SK")
    }
}
