//
//  06_07.swift
//  AKAlgorithm
//
//  Created by milli on 2023/06/05.
//

import Foundation

// 별찍기
func b2448() {
    
}

// 첫째 줄에 첫 번째 장대에 쌓인 원판의 갯수가 주어진다.
let n = Int(readLine()!)!
var count = 0
var result = ""

// 하노이 탑 이동 순서
func b11729() {
    hanoi(num: n, from: 1, to: 3, middle: 2)
    print(count)
    print(result)
}

func hanoi(num: Int, from: Int, to: Int, middle: Int) {
    if num == 1 {
        count += 1
        result += "\(from) \(to)\n"
        return
    }
    
    // 첫번째 기둥에서 가운데 기둥으로 옮기기 위함
    hanoi(num: num-1, from: from, to: middle, middle: to)
    result += "\(from) \(to)\n"
    //
    count += 1
    // 가운데 기둥에서 3번째 기둥으로 옮기기 위함
    hanoi(num: num-1, from: middle, to: to, middle: from)
}
