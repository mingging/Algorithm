//
//  B_9086.swift
//  AKAlgorithm
//
//  Created by milli on 2023/04/17.
//

import Foundation

/// 문자열을 입력으로 주면 문자열의 첫 글자와 마지막 글자를 출력하는 프로그램을 작성하시오
func b9086() {
    /// 입력의 첫 줄에는 테스트 케이스의 갯수가 주어진다
    /// (1 <= T <= 10)
    let testCaseCount = readLine()
    
    var testCaseArray: [String] = []
    
    guard let testCaseCount = testCaseCount,
          let count = Int(testCaseCount)
    else { return }
    
    /// 각 테스트 케이스는 한 줄에 하나의 문자열이 주어진다.
    for _ in 0..<count {
        if let testCaseString = readLine() {
            testCaseArray.append(testCaseString)
        }
    }
    
    print("--------------------------")
    
    /// 각 테스트 케이스에 대해서 주어진 문자열의 첫 글자와 마지막 글자를 연속하여 출력한다.
    
    /// first, last 로 구하는 방법
    let _ = testCaseArray.map { value in
        guard let first = value.first,
           let last = value.last
        else { return }
//        print("\(first)\(last)")
    }
    
    /// index 값으로 구하는 방법
    for i in 0..<testCaseArray.count {
        let array = Array(testCaseArray[i])
        print("\(array[0])\(array[array.count-1])")
    }
}


/// 수열을 만들고 어느 일정한 구간을 주면 그 구간의 합을 구하라
func b1292() {
    /// 첫째 줄에 구간의 시작과 끝을 나타내는 정소 A, B(1 <= A <= B <= 1,000)가 주어진다.
    
}
