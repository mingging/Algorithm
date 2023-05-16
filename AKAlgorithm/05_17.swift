//
//  05_17.swift
//  AKAlgorithm
//
//  Created by min on 2023/05/16.
//

import Foundation

/// 모든 박스를 배로 옮기는데 드는 시간의 최솟값을 구하는 프로그램을 작성하시오
func b1092() {
    /// 첫째 줄에는 N이 주어진다 (크레인 수)
    let n = Int(readLine()!)!
    
    /// 두번째 줄에는 각 크레인의 무게 제한이 주어진다.
    let weightLimits = readLine()!.components(separatedBy: " ")
    let weightLimitsArray = weightLimits.map { Int($0)! }.sorted(by: <)
    
    /// 세번째 줄에는 박스의 수 M이 주어진다.
    let m = Int(readLine()!)
    
    /// 네번째 줄에는 각 박스의 무게가 주어진다.
    let boxWeight = readLine()!.components(separatedBy: " ")
    var boxWeightArray = boxWeight.map { Int($0)! }.sorted(by: <)
    
    print("weightLimitsArray : \(weightLimitsArray)")
    print("boxWeight : \(boxWeightArray)")

    var minute = 0
    
    while true {
        if boxWeightArray[boxWeightArray.count - 1] >= weightLimitsArray[weightLimitsArray.count - 1] {
            minute = -1
            break
        }
        
        if boxWeightArray.isEmpty {
            break
        }
        
        for i in 0..<weightLimitsArray.count {
            for j in 0..<boxWeightArray.count {
                if weightLimitsArray[i] >= boxWeightArray[j] {
                    boxWeightArray.remove(at: j)
                    break
                }
            }
            
            print("weightLimitsArray : \(weightLimitsArray)")
            print("boxWeightArray : \(boxWeightArray)")
        }
        minute += 1
    }
    
    print("minute : \(minute)")
}

func test_b1092() {

    let n = Int(readLine()!)!
    let weightLimits = readLine()!.components(separatedBy: " ")
    let weightLimitsArray = weightLimits.map { Int($0)! }.sorted(by: <)

    let m = Int(readLine()!)
    let boxWeight = readLine()!.components(separatedBy: " ")
    var boxWeightArray = boxWeight.map { Int($0)! }.sorted(by: <)

    var minute = 0
        
    while true {

         if boxWeightArray[boxWeightArray.count - 1] >= weightLimitsArray[weightLimitsArray.count - 1] {
             minute = -1
             break
         }
        
        if boxWeightArray.isEmpty {
            break
        }

        for i in 0..<weightLimitsArray.count {
            for j in 0..<boxWeightArray.count {
                if weightLimitsArray[i] >= boxWeightArray[j] && boxWeightArray[j] != 0 {
                    boxWeightArray.remove(at: j)
                    break
                }
            }
        }
        minute += 1
    }

    print(minute)
}
