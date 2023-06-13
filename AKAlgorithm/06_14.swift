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
    // 첫째 줄에 테스트 케이스 갯수 T가 주어진다.
    let t = Int(readLine()!)!
    
    var testCaseArray: [Int] = []
    
    for _ in 0..<t {
        // 정수 n이 주어진다
        let n = Int(readLine()!)!
        testCaseArray.append(n)
    }
     
    // 정수가 1일때 만들 수 있는 가짓수는 1개다 (1)
    // 정수가 2일때 만들 수 있는 가짓수는 2개다 (1+1, 2)
    // 정수가 3일때 만들 수 있는 가짓수는 4개다 (3, 1+1+1, 2+1, 1+2)
    // 정수가 4일때 만들 수 있는 가짓수는 7개다 (4 + 2 + 1 = 7)
        // 1로 4를 만드려면 3이 필요하다 3을 만들 수 있는 가짓수는 4가지다.
        // 2로 4를 만드려면 2가 필요하다 2를 만들 수 있는 가짓수는 2가지다.
        // 3로 4를 만드려면 1이 필요하다 1를 만들 수 있는 가짓수는 1가지다.
    // 정수가 5일때 만들 수 있는 가짓수는 13개다 (7 + 4 + 2 = 13)
        // 1로 5를 만드려면 4가 필요하다 4를 만들 수 있는 가짓수는 7가지다.
        // 2로 5를 만드려면 3이 필요하다 3을 만들 수 있는 가짓수는 4가지다.
        // 3로 5를 만드려면 2가 필요하다 2를 만들 수 있는 가짓수는 2가지다.
    
    // 4를 만들기 위해서는 1 + 3, 2 + 2, 3 + 1 이 필요하다
    // 5를 만들기 위해서는 1 + 4, 2 + 3, 3 + 2 이 필요하다
 
    // 1부터 3까지는 정해져있기 때문에 미리 저장해둔다.
    var numberArray: [Int] = [1, 2, 4]

    // n은 양수이며 11보다 작기 때문에 10까지로 둔다.
    for i in 3..<10 {
        let cal = numberArray[i - 1] + numberArray[i - 2] + numberArray[i - 3]
        numberArray.append(cal)
    }
    
    for i in 0..<testCaseArray.count {
        print(numberArray[testCaseArray[i] - 1])
    }
    
}

// 돌 게임
func b9655() {
    // 탁자 위에 돌 N개가 있다.
    let n = Int(readLine()!)!
    
    // 상근이와 창영이는 턴을 번갈아 가면서 돌은 1개 또는 3개 가져갈 수 있다.
}
