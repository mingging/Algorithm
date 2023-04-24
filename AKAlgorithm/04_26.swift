//
//  04_26.swift
//  AKAlgorithm
//
//  Created by milli on 2023/04/24.
//

import Foundation

/// 문장이 주어졌을 때, 단어를 모두 뒤집어서 출력하는 프로그램을 작성하시오.
func b9093() {
    /// 첫째 줄에는 테스트 케이스의 갯수 T가 주어진다.
    let t = Int(readLine()!) ?? 0
    var testCaseArray: [String] = []
    
    /// 테스트 케이스 갯수 만큼 입력받아 저장한다.
    for _ in 0..<t {
        let testCase = readLine() ?? ""
        testCaseArray.append(testCase)
    }
    
    /// 각 문장을 공백 기준으로 나눈 뒤 뒤집는다.
    for i in 0..<testCaseArray.count {
        /// 공백 기준으로 나눈다.
        var splitArray = testCaseArray[i].components(separatedBy: " ")
        
        /// 공백 기준으로 나눈 후 각 배열의 값을 뒤집는다
        for j in 0..<splitArray.count {
            var tempString = ""
            for string in splitArray[j].reversed() {
                /// 나눠진 값을 합치기
                tempString += "\(string)"
            }
            
            /// 합친 값을 다시 배열에 넣어주기
            splitArray[j] = tempString
        }
        
        /// 전체 문자 합쳐서 출력
        print(splitArray.joined(separator: " "))
    }
}

/// 모든 접미사를 사전순으로 정렬한 다음 출력하는 프로그램을 작성하시오
func b11656() {
    /// 문자열 S를 입력받는다
    let s = readLine()!
    
    /// 접미사 배열을 만든다
    /// 음.. 일단.. 한 자리씩.. 빼서.. 배열 만들기..?
    
    /// 일단 각각 문자 배열 만들고
    let stringArray = s.map { String($0) }
    
    var suffiexsArray: [String] = []
    var suffixeIndex = 0
    for _ in 0..<stringArray.count {
        var tempString = ""
        for j in suffixeIndex..<stringArray.count {
            /// index 부터 끝까지 String 만들어서
            tempString += stringArray[j]
        }
        /// 배열에 넣고
        suffiexsArray.append(tempString)
        suffixeIndex += 1
    }
    
    /// 내림차순으로 출력
    print(suffiexsArray.sorted(by: <).joined(separator: "\n"))
}
