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

var tArray: [String] = []

// A와 B 2
func b12919() {
    // 첫째 줄에 S가 주어진다
    let s = readLine()!.map{ String($0) }

    // 둘째 줄에 T가 주어진다
    let t = readLine()!
    tArray = t.map { String($0) }

    // 두 가지의 조건이 있다.
    // 문자열 뒤에 A를 추가한다.
    // 문자열 뒤에 B를 추가하고 문자열을 뒤집는다.
    var resultArray: [String] = []
    // T만큼 반복한다.
    for _ in 0..<t.count {
        resultArray = makeWord(word: s)
    }

    print("resultArray : \(resultArray)")

    if resultArray.joined() == tArray.joined() {
        print("1")
    } else {
        print("0")
    }

}

func makeWord(word: [String]) -> [String] {
    var index = 0
    var tempWords = word

    // 현재 문자열과 다른 문자를 찾는다.
    for i in 0..<tArray.count {

        if word[index] != tArray[i] && word.count != tArray.count {
            print("tArray[i] : \(tArray[i])")
            // 다르면 해당 문자를 뒤에 붙여준다.
            tempWords.append(tArray[i])
            // A면 그냥 붙여주고
            if tArray[i] == "A" {
                //
            }
            
            if tArray[i] == "B" {
                // B면 붙이고 뒤집어준다.
                tempWords = tempWords.reversed()
            }

            print("tempWords : \(tempWords)")

            return makeWord(word: tempWords)
        } else {
            index += 1

            print("index : \(index)")

            // 만약 index가 넘어갔는데 길이가 다르면 index 유지한 채 넘긴다.
            if index > word.count - 1 {
                index -= 1
            }
        }
    }

    return tempWords
}

//var tArray: [String] = []
//
//func test12919() {
//    let s = readLine()!.map{ String($0) }
//
//    // 둘째 줄에 T가 주어진다
//    let t = readLine()!
//    tArray = t.map { String($0) }
//
//    // 두 가지의 조건이 있다.
//    // 문자열 뒤에 A를 추가한다.
//    // 문자열 뒤에 B를 추가하고 문자열을 뒤집는다.
//    var resultArray: [String] = []
//
//    // T만큼 반복한다.
//    for _ in 0..<t.count {
//        resultArray = makeWord2(word: s)
//    }
//
//    if resultArray.joined() == tArray.joined() {
//        print("1")
//    } else {
//        print("0")
//    }
//}
//
//func makeWord2(word: [String]) -> [String] {
//    var index = 0
//    var tempWords = word
//
//    // 현재 문자열과 다른 문자를 찾는다.
//    for i in 0..<tArray.count {
//
//        if word[index] != tArray[i] && word.count != tArray.count {
//            // 다르면 해당 문자를 뒤에 붙여준다.
//            tempWords.append(tArray[i])
//            // A면 그냥 붙여주고
//            if tArray[i] == "A" {
//                //
//            }
//
//            if tArray[i] == "B" {
//                // B면 붙이고 뒤집어준다.
//                tempWords = tempWords.reversed()
//            }
//            return makeWord2(word: tempWords)
//        } else {
//            index += 1
//
//            // 만약 index가 넘어갔는데 길이가 다르면 index 유지한 채 넘긴다.
//            if index > word.count - 1 {
//                index -= 1
//            }
//        }
//    }
//
//    return tempWords
//}
