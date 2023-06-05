//
//  05_31.swift
//  AKAlgorithm
//
//  Created by min on 2023/05/30.
//

import Foundation

// 생태학
func b4358() {
    var treeArray: [String: Double] = [:]
    var allCount: Double = 0

    // 한 줄에 하나의 나무 종 이름이 주어진다.
    while true {
        // 추가로 입력받은게 비어있을 경우 break
        if let tree = readLine(),
           !tree.isEmpty
        {
            allCount += 1
            treeArray[tree] = (treeArray[tree] ?? 0) + 1
        } else {
            break
        }
    }

    var persentage: Double = 0.0

    // 백분율 구하기
    for (key, value) in treeArray {
        persentage = (value / allCount) * 100
        
        // 소수점 네번째 자리까지 반올림
        treeArray[key] = round(persentage * 10000) / 10000
    }

    // 사전 순으로 출력
    let sortedTree = treeArray.sorted { $0.0 < $1.0 }
    for i in 0..<sortedTree.count {
        print("\(sortedTree[i].key) \(String(format: "%.4f", sortedTree[i].value))")
    }
}

