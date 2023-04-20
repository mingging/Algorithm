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
    
    /// 테스트 케이스의 조건에 맞지 않을 경우 return
    if count < 1 || count > 10 {
        print("테스트 케이스의 조건에 맞지 않습니다.")
        return
    }
    
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
        print("\(first)\(last)")
    }
    
    /// index 값으로 구하는 방법
    for i in 0..<testCaseArray.count {
        let array = Array(testCaseArray[i])
//        print("\(array[0])\(array[array.count-1])")
    }
}


/// 수열을 만들고 어느 일정한 구간을 주면 그 구간의 합을 구하라
func b1292() {
    /// 첫째 줄에 구간의 시작과 끝을 나타내는 정수 A, B(1 <= A <= B <= 1,000)가 주어진다.
    guard let input = readLine() else { return }
    let inputArray = input.components(separatedBy: " ")
    
    guard let startNumber = Int(inputArray[0]),
          let endNumber = Int(inputArray[inputArray.count - 1])
    else { return }
    
//    print(startNumber)
//    print(endNumber)
    
    /// 입력값이 조건에 맞지 않을 경우 reutrn
    if startNumber < 1 || startNumber > endNumber {
        print("시작 숫자가 조건에 맞지 않습니다.")
        return
    } else if endNumber > 1000 {
        print("끝 숫자가 조건에 맞지 않습니다.")
        return
    }
    
    /// 1을 한 번, 2를 두 번, 3을 세 번 수열을 만든다
    /// B의 구간까지 수열을 만든다
    var numberArray: [Int] = []
    for i in 1...endNumber {
        for _ in 1...i {
            numberArray.append(i)
        }
    }
    
    /// A 구간부터 B 구간까지의 합을 구한다.

    /// 1: for 문으로 index 체크해서 더해주기
    var sumNumber = 0
    for i in 1...numberArray.count {
        if i >= startNumber {
            sumNumber += numberArray[i - 1]
        }
        
        if i == endNumber {
            break
        }
    }
    
    /// 2: map, reduce 이용하기
    /// 배열이 0 부터 시작하기 때문에 - 1을 해줘야함
    let sumNumber2 = numberArray[(startNumber - 1)..<endNumber].map { $0 }.reduce(0) { $0 + $1 }
    
    print(sumNumber2)
}

/// 수가 주어지면, 그 수의 각 자리수를 내림차순으로 정렬해보자.
func b1427() {
    /// 정렬하려고 하는 수 N이 주어진다.
    let number = readLine()
    
    /// N은 1,000,000,000 보다 작거나 같은 자연수이다.
    guard let number = number,
        let intNumber = Int(number)
    else { return }
    
    if intNumber > 1000000000 {
        print("다시 입력해주세요.")
        return
    }
    
    /// 첫째 줄의 자리수를 내림차순으로 정렬한 수를 출력한다.
    /// 2143
    var numberArray = number.map { String($0) }
  
    var temp: String = ""
    
    /// for문을 돌면서 이전 값과 다음값의 차이를 구한 뒤, 뒤가 더 크면 자리를 바꾼다.
    for i in 0..<numberArray.count {
        /// 한 숫자 당 한 줄을 다 돌 때까지 반복한다.
        print("i numberArray : \(numberArray)")
        for j in i..<numberArray.count {
            /// 현재 값 보다 다음 값이 더 큰지 비교한다.
            print("j numberArray : \(numberArray)")
            if numberArray[i] < numberArray[j] {
                /// 다음 값이 더 클 경우 현재 값을 temp에 저장해놓는다.
                temp = numberArray[i]
                /// 다음 값을 현재 값에 넣는다.
                numberArray[i] = numberArray[j]
                /// 현재 값을 다음 값에 넣는다.
                numberArray[j] = temp
            }
        }
    }
    
    /// 나눠져 있는 배열 합쳐서 출력
    print(numberArray.joined())
}
