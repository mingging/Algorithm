//
//  07_05.swift
//  AKAlgorithm
//
//  Created by min on 2023/07/04.
//

import Foundation

// PPAP
func b16120() {
    // 첫번째 줄에 문자열이 주어진다.
    var n = readLine()!.map { String($0) }
    var pCount = 0
    var pIndex: [Int] = []
    
    print(n)
    
    
    // n의 카운트가 1보다 클 때만
    whileRoop: while true {
        
        // 남은 값이 P 하나일 경우 종료
        if n.joined(separator: "") == "P" {
            break
        }
        
        // 문자열을 돌면서 A를 찾는다.
        for i in 0..<n.count {
            if n[i] == "A" {
                // A인 경우 앞에 P가 두개 이상 확인한다. = pCount가 2개 이상인지 확인한다.
                print("pcount : \(pCount)")
                if pCount >= 2 {
                    
                    print("over P2")
                    
                    // 2개 이상이라면 해당 위치의 PPAP를 P로 바꿔준다.
                    n[i+1] = "P"
                    // 시간 초과
//                    n.removeSubrange(i-2...i)
                    
                    print("pIndex : \(pIndex)")
                    print("before n : \(n)")
                    
                    // pIndex에 저장된 P의 위치를 제거해준다.
                    n[pIndex[pIndex.count - 1]] = ""
                    n[pIndex[pIndex.count - 2]] = ""
                    print("lastindex :\(pIndex.last! - 1)")
                    n[i] = ""
                    
                    print("after n : \(n)")
                    
                    pCount = 0
                    pIndex = []
                    
                    print(n)
                    
                    break
                } else {
                    // 2개가 되지 않는다면 while문을 종료한다.
                    print("NP")
                    break whileRoop
                }
            } else {
                // 아닌 경우 P이기 때문에 p의 카운트를 올려준다.
                if n[i] == "P" {
                    pCount += 1
                    
                    // 아닌 경우 p의 index를 저장해둔다.
                    pIndex.append(i)
                }
            }
        }
    }
    
    // n이 한개만 남았다면 PPAP 문자열이다.
    if n.joined(separator: "") == "P" {
        print("PPAP")
    }
}
    
