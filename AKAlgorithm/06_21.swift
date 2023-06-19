//
//  06_21.swift
//  AKAlgorithm
//
//  Created by min on 2023/06/20.
//

import Foundation

// 점화식
func b13699() {
    // 첫째 줄에 n이 주어진다.
    let n = Int(readLine()!)!
    
    // 35개까지 받을 수 있다.
    var numberArray: [Int] = [Int](repeating: 0, count: 36)
    
    // t(0) = 1이다
    numberArray[0] = 1
    numberArray[1] = 1
    numberArray[2] = 2
    numberArray[3] = 5
    
    var plus = 0
    var minus = 1
    var sum = 0
    
    // t(0) * t(n - 1) + t(1) * t(n - 2) 로 계속 더한다.

    if n > 3 {
        for i in 4...n {
            // i = 4
            // plus = 0
            // minus = 1
            while i - minus >= 0 {
                sum += numberArray[plus] * numberArray[i - minus]
                
                plus += 1
                minus += 1
            }
            
            numberArray[i] = sum
            plus = 0
            minus = 1
            sum = 0
           
        }
    }
    
    print(numberArray[n])
}

// 거스름돈
func b14916() {
    // 첫째 줄에 거스름돈 액수 n이 주어진다.
    let n = Int(readLine()!)!
    var rest: Int = n
    var chargeCount: Int = 0
    
    // 돈을 계속 거슬러 줄 수 있을 때까지 반복
    while rest > 0 {
        // 만약 액수가 2보다 작으면 -1 또는 -가 되면
        if n < 2 {
            chargeCount = -1
            break
        }
        
        // 만약 짝수인 경우 2부터 빼준다.
        if rest % 2 == 0 {
            // 만약 짝수인데 5의 배수라면 5로 제거해준다.
            if rest % 5 == 0 {
                rest = rest - 5
                chargeCount += 1
            } else {
                rest = rest - 2
                chargeCount += 1
            }
            
      
        } else if rest % 2 == 1 {  // 만약 홀수인 경우 5부터 빼준다.
            rest = rest - 5
            chargeCount += 1
        }
        
        print("rest : \(rest)")
        print("chargeCount: \(chargeCount)")
    }
    
    // 만약 rest가 0이 아니라 -가 되면
    if rest < 0 {
        chargeCount = -1
    }
    
    print(chargeCount)
}

// 마인크래프트
func b18111() {
    // 첫째 줄에 N, M, B가 주어진다.
    let line = readLine()!.split(separator: " ")
    let n = Int(line[0])!
    let m = Int(line[1])!
    let b = Int(line[2])!
    
    // 땅을 만든다
    var landArray: [[Int]] = [[Int](repeating: 0, count: m)]
    
    for i in 0..<m {
//        let jLand = readLine()!.split(separator: " ")
//        for j in 0..<jLand.count {
//            landArray[i][j] = Int(jLand[j])!
//        }
    }
    
    
    print(landArray)
}
