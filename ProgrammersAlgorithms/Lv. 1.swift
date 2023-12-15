//
//  Lv. 1.swift
//  ProgrammersAlgorithms
//
//  Created by min on 2023/11/28.
//

import Foundation

// 달리기 경주
func solution_178871(_ players:[String], _ callings:[String]) -> [String] {
    
    // 플레이어가 앞지를 때마다 부른다.
    // 부른 플레이어의 위치를 알아내서 한칸 앞으로 이동한다.
    
    var resultPlayer = players
    
    // 부른 만큼 반복한다.
    for i in 0..<callings.count {
        // 부른 플레이어의 위치를 알아낸다.
        let playerIndex = resultPlayer.lastIndex(of: callings[i])!

        // 앞으로 한 칸 옮기기
        resultPlayer[playerIndex] = resultPlayer[playerIndex - 1]
        resultPlayer[playerIndex - 1] = callings[i]
    }
    
    return resultPlayer
}

// 대충 만든 자판
func solution_160586(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var resultIndex: [Int] = []
    var sum = 0
    var targetIndex: Int = 0
    var indexArray: [Int] = []
   
    // 문자 하나씩 배열에 있는지 찾는다.
    for t in 0..<targets.count {
        let currentTarget: [String] = targets[t].map { String($0) }
        print("currentTarget : \(currentTarget)")
        
        while targetIndex < currentTarget.count {
            for i in 0..<keymap.count {
                let keymapArray: [String] = keymap[i].map { String($0) }
                
                print("keymapArray : \(keymapArray)")
                
                if let index = keymapArray.firstIndex(of: currentTarget[targetIndex]) {
                    indexArray.append(index)
                }
            }
            
            print("indexArray : \(indexArray)")
            // 만약 indexArray 가 비어있으면 -1을 출력하고 break
            if indexArray.isEmpty {
                // -1
                indexArray = []
                sum = -1
                break
            }
            
            // 배열에서 가장 작은 수를 가져온다.
            if let minIndex = indexArray.min() {
                print("가장 작은 수 : \(minIndex)")
                sum += minIndex + 1
            }
            
            indexArray = []
            targetIndex += 1
        }
        
        // 만약 sum이 0이면 -1 추가
        if sum == 0 {
            sum = -1
        }
        
        resultIndex.append(sum)
        sum = 0
        targetIndex = 0
    }
    
    return resultIndex
}
