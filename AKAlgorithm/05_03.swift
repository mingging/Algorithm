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
    /// 문자열을 배열로 만들고 오름차순으로 정렬한다.
    let nameArray = name.map { String($0) }.sorted(by: <)
    
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
            var afterPlus = point - 100
            var beforePlus = (point - mushrooms[i]) - 100
            
            /// 만약 포인트가 100을 넘었으나 100에 가깝다면 해당 포인트를 선택한다.
            if point > 100 {
                afterPlus = afterPlus < 0 ? -(afterPlus) : afterPlus
                beforePlus = beforePlus < 0 ? -(beforePlus) : beforePlus
                if afterPlus != beforePlus {
                    point -= mushrooms[i]
                }
                break
            }
        }
    }
    
    print(point)
}

/// M개의 수가 A안에 존재하는지 알아내고, 존재하면 1, 존재하지 않으면 0을 출력한다.
func b1920() {
    /// 첫째 줄에 자연수 N이 주어진다.
    let n = Int(readLine()!)!
    
    /// 다음 줄에는 N개의 정수 A[N] 이 주어진다.
    var nArray: [String] = []
    let nNumber = readLine()!
    nArray = nNumber.components(separatedBy: " ")
    
    /// 탐색을 위해 정렬한다.
    nArray = nArray.sorted(by: <)
    
    /// 다음 줄에는 M이 주어진다.
    let m = Int(readLine()!)!
    
    /// 다음 줄에는 M개의 수들이 주어진다.
    var mArray: [String] = []
    let mNumber = readLine()!
    mArray = mNumber.components(separatedBy: " ")

    /// M의 값이 A 값에 있는지 찾는다
    for i in 0..<m {
        /// 이분 탐색을 위해 첫번째 index와 마지막 index를 구해놓는다.
        var firstIndex = 0
        var lastIndex = nArray.count - 1
        /// firstIndex가 lastIndex 보다 작을 때만 반복한다.
        while(firstIndex <= lastIndex) {
            /// 찾으려는 값을 찾기 위해 가운데 index부터 탐색을 시작한다.
            let mid = (firstIndex + lastIndex) / 2
            
            /// 만약 M 값이 mid 값보다 작으면 끝 범위를 중간보다 하나 작게 만든다
            if mArray[i] < nArray[mid] {
                lastIndex = mid - 1
            }
            /// 만약 M 값이 mid 값보다 크면 첫 범위를 중간보다 하나 크게 만든다
            else if mArray[i] > nArray[mid] {
                firstIndex = mid + 1
            }
            /// M의 값과 mid 값이 같다면 찾았기 때문에 1을 출력한다.
            else if mArray[i] == nArray[mid] {
                print("1")
                break
            }
            
//            print("mArray[i] : \(mArray[i])")
//            print("nArray[mid] : \(nArray[mid])")
//            print("mid : \(mid)")
            
        }
        
        /// firstIndex가 lastIndex보다 큰데 break가 되지 않았을 경우 못찾았기 때문에 0을 출력한다.
        if firstIndex > lastIndex {
            print("0")
        }

        
    }
    
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
