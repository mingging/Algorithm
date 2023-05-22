//
//  05_25.swift
//  AKAlgorithm
//
//  Created by min on 2023/05/22.
//

import Foundation

/// 베열을 담을 변수
var seatArray: [[Int]] = []

/// 특별상이라도 받고 싶어
func b24460() {
    /// 첫 번째 줄에는 정수 N이 주어진다.
    let n = Int(readLine()!)!
    
    /// 두번째 줄부터 N개의 줄에 i번째 줄에 있는 의자에 적힌 추첨번호가 주어진다.
    for i in 0..<n {
        /// 의자 순서대로 배열에 저장한다.
        let seatNumbers = readLine()!.components(separatedBy: " ")
        seatArray.append(seatNumbers.map { Int($0)! })
    }
    
    let seat = setSeat(size: n, x: 0, y: 0)
    print(seat)
}

func setSeat(size: Int, x: Int, y: Int) -> Int {
    
    if size < 2 {
        return seatArray[x][y]
    }
    
    let halfSize = size / 2
    var tempArray: [Int] = [Int](repeating: 0, count: 4)
    
    for i in 0..<4 {
        let nx = x + (i % 2) * halfSize
        let ny = y + (i / 2) * halfSize
        
        tempArray[i] = setSeat(size: halfSize, x: nx, y: ny)
        print("tempArray : \(tempArray)")
    }
    
    tempArray = tempArray.sorted(by: <)
    return tempArray[1]
}
