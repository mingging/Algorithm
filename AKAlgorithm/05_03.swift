//
//  05_03.swift
//  AKAlgorithm
//
//  Created by milli on 2023/05/02.
//

import Foundation

/// 팰린드롬 만들기
func b1213() {
    /// 첫째줄에 임한수의 영어 이름이 있다
    let name = readLine()!
    
    /// AABB
    /// 
}

/// 버섯의 점수가 주어졌을 때, 마리오가 받는 점수를 출력하는 프로그램을 작성하시오.
func b2851() {
    /// 10개의 버섯을 입력받는다
    var mushrooms: [Int] = []
    
    for _ in 0..<10 {
        let mushroom = Int(readLine()!)!
        mushrooms.append(mushroom)
    }
    
    var point: Int = 0
    
    /// 첫번째 버섯부터 하나씩 먹는다
    for i in 0..<mushrooms.count {
        /// point가 100보다 작으면 point를 더해준다.
        if point <= 100 {
            point += mushrooms[i]
            
            /// 만약 버섯을 먹었는데 먹기 전보다 멀다면 버섯을 먹지 않는다.
            let afterPlus = point - 100
            let beforePlus = (point - mushrooms[i]) - 100
            
//            print("after = \(afterPlus)")
//            print("before = \(beforePlus)")
//            print("point = \(point)")

            if afterPlus > beforePlus && point > 100 {
                /// 만약 포인트가 100을 넘었으나 100에 가깝다면 해당 포인트를 선택한다.
                if afterPlus != -(beforePlus) {
                    point -= mushrooms[i]
                }
                break
            }
        }
    }
    
    print(point)
}

func cc() {
    var mushrooms: [Int] = []
    var point: Int = 0
    for _ in 0..<10 {
        let mushroom = Int(readLine()!)!
        mushrooms.append(mushroom)
    }
    for i in 0..<mushrooms.count {
        if point <= 100 {
            point += mushrooms[i]
            let afterPlus = point - 100
            let beforePlus = (point - mushrooms[i]) - 100
            if afterPlus > beforePlus && point > 100 {
                if afterPlus != -(beforePlus) {
                    point -= mushrooms[i]
                }
                break
            }
        }
    }

    print(point)
}
