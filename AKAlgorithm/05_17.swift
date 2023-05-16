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
    let weightLimitsArray = weightLimits.map { Int($0)! }.sorted(by: >)
    
    /// 세번째 줄에는 박스의 수 M이 주어진다.
    let m = Int(readLine()!)
    
    /// 네번째 줄에는 각 박스의 무게가 주어진다.
    let boxWeight = readLine()!.components(separatedBy: " ")
    var boxWeightArray = boxWeight.map { Int($0)! }.sorted(by: >)
    
    print("weightLimitsArray : \(weightLimitsArray)")
    print("boxWeight : \(boxWeightArray)")

    var minute = 0
    
    if boxWeightArray[boxWeightArray.count - 1] >= weightLimitsArray[weightLimitsArray.count - 1] {
        minute = -1
    } else {
        while true {
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
    }
    
    print("minute : \(minute)")
}

/// 각 사람들이 기억하는 정보가 주어질 때, 줄을 어떻게 서야 하는지 출력하는 프로그램을 작성하시오.
func b1138() {
    /// 첫째 줄에 사람 수 N이 주어진다.
    let n = Int(readLine()!)!
    
    /// 둘째 줄에는 키가 1인 사람부터 차레대로 자기보다 키가 큰 사람이
    /// 왼쪽에 몇 명이 있었는지 주어진다.
    let leftPeople = readLine()!.components(separatedBy: " ")
    let leftPeopleArray = leftPeople.map { Int($0)! }
    
    var lineArray: [Int] = [Int](repeating: 0, count: n)
    
    var leftPeopleCount = 0
    
    /// 줄을 선 순서대로 키를 출력한다.
    for i in 0..<n {
        /// 현재 위치에서 자신보다 큰 숫자가 leftPeople 만큼 있을 때까지 이동한다.
        for j in 0..<n {
            /// 현재 위치 값이 0이거나, 현재 값보다 크다면
            if lineArray[j] == 0 || lineArray[j] > i + 1 {
                /// 만약 leftPeopleCount 가 leftPeople 만큼 있으면 해당 위치에서 멈춘다.
                if leftPeopleCount == leftPeopleArray[i] {
                    lineArray[j] = i + 1
                    leftPeopleCount = 0
                    break
                } else {
                    /// 그렇지 않으면 현재 위치보다 클 때까지 계속 탐색한다.
                    leftPeopleCount += 1
                }
            }
        }
        
        print("leftPeopleCount : \(leftPeopleCount)")
        print("leftPeopleArray : \(leftPeopleArray)")
        print("lineArray : \(lineArray)")
        print("-------------------------------")
    }
    
    print(lineArray.map { String($0) }.joined(separator: " "))
}

func test_b1092() {
    let n = Int(readLine()!)!
    let weightLimits = readLine()!.components(separatedBy: " ")
    let weightLimitsArray = weightLimits.map { Int($0)! }.sorted(by: >)

    let m = Int(readLine()!)
    let boxWeight = readLine()!.components(separatedBy: " ")
    var boxWeightArray = boxWeight.map { Int($0)! }.sorted(by: >)

    var minute = 0
        
    if boxWeightArray[boxWeightArray.count - 1] >= weightLimitsArray[weightLimitsArray.count - 1] {
        minute = -1
    } else {
        while true {
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
            }
            minute += 1
        }
    }

    print(minute)
}
