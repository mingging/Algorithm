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
    
    /// 오름차순으로 출력
    print(suffiexsArray.sorted(by: <).joined(separator: "\n"))
}

/// 방 번호가 주어졌을 때, 필요한 세트의 최솟값을 출력하시오
func b1457() {
    /// 첫째 줄에 다솜이의 방 번호 N 이 주어진다.
    let roomNumber = readLine() ?? ""
    
    /// 세트의 갯수 배열을 하나 만든다.
    let numberSet: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var numberCountSet: [Int] = [Int](repeating: 1, count: numberSet.count)
    
    /// 세트 갯수를 위한 변수를 하나 만든다.
    var setCount: Int = 1
    
    /// 방 번호를 나눈 후
    let roomNumberArray: [String] = roomNumber.map { String($0) }
    
    /// 세트와 비교하여 있는지 확인한다.
    for i in 0..<roomNumberArray.count {
        for j in 0..<numberSet.count {
            
            /// 하나씩 비교하면서 numberSet에 갯수가 있는 지 확인
            if roomNumberArray[i] == numberSet[j] {
                
                /// 만약 value가 0, 세트가 없을 경우 세트 하나 추가
                if numberCountSet[j] == 0 {
                    
                    if roomNumberArray[i] == "6" && numberCountSet[9] != 0 {
                        numberCountSet[9] = numberCountSet[9] - 1
                        break
                    }
                    
                    if roomNumberArray[i] == "9" && numberCountSet[5] != 0 {
                        numberCountSet[5] = numberCountSet[5] - 1
                        break
                    }
                    
                    setCount += 1
                    
                    /// numberSet에 하나씩 더 추가
                    numberCountSet = numberCountSet.map { $0 + 1 }
                    
                }
                
                /// 있으면 numberCount를 하나 빼기
                numberCountSet[j] = numberCountSet[j] - 1
            }
        }
    }
    
    print(setCount)
}

func aa() {
    let roomNumber = readLine() ?? ""
    var roomNumberArray = roomNumber.map { String($0) }
    var newArray: [String] = []
    var result = 0
    
    print(roomNumberArray)
   
    /// 세트가 기본 1개이고 중복이 있을 경우 1개씩 더 늘어난다.
    /// 대신 6과 9는 서로를 대신할 수 있다. -> 그러므로 세트가 하나 더 필요하지 않다.
 
    /// 6과 9는 서로를 대체할 수 있다.
    /// 예시 666998 -> 66(한세트), 69(한세트), 9(한세트) 총 3 세트가 나올 수 있다.
    /// 9999 -> 99(한세트), 99(한세트) 총 2세트가 나올 수 있다.
    
    /// 6과 9의 갯수가 나온 만큼 세어본다
    var sixNineCount: CGFloat = 0
    for i in 0..<roomNumberArray.count {
        if roomNumberArray[i] == "6" || roomNumberArray[i] == "9" {
            sixNineCount += 1
        } else {
            /// 6과 9를 제외한 값을 새로운 배열에 저장한다.
            newArray.append(roomNumberArray[i])
        }
    }
    
    print("roomNumberArray : \(roomNumberArray)")
    print("newArray : \(newArray)")
    
    /// 나온 갯수를 2개 묶음으로 나누어준다.
    /// 예시 5 / 2 = 3 (2.5)
    print("sixNineCount : \(sixNineCount)") /// 5
    print(Int(round(sixNineCount / 2.0))) /// 3
   
    let duplicateCount = Int(round(sixNineCount / 2.0))
    
    /// 남은 숫자의 대해 중복 값을 제거한다.
    let roomNumberSet2 = Set(newArray)
    
    /// 이전 갯수와 중복을 제거한 값을 비교한다.
    let compareNumber = newArray.count - roomNumberSet2.count
    
    /// 기본 1개의 세트를 더해준다.
    let defaultSetCount = compareNumber
    print("compareNumber : \(compareNumber)")
    print("defaultSetCount : \(defaultSetCount)") /// 2
    
    /// 나온 값을 더해준다.
    result = duplicateCount + defaultSetCount
    
    print("result : \(result)")
}

func bb() {
    let roomNumber = readLine() ?? ""
    let numberSet: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var numberCountSet: [Int] = [Int](repeating: 1, count: numberSet.count)
    var setCount: Int = 1
    let roomNumberArray: [String] = roomNumber.map { String($0) }

    for i in 0..<roomNumberArray.count {
        for j in 0..<numberSet.count {
            if roomNumberArray[i] == numberSet[j] {
                if numberCountSet[j] == 0 {
                    if roomNumberArray[i] == "6" && numberCountSet[9] != 0 {
                        numberCountSet[9] = numberCountSet[9] - 1
                        break
                    }
                    if roomNumberArray[i] == "9" && numberCountSet[6] != 0 {
                        numberCountSet[6] = numberCountSet[6] - 1
                        break
                    }
                    setCount += 1
                    numberCountSet = numberCountSet.map { $0 + 1 }
                }
                
                numberCountSet[j] = numberCountSet[j] - 1
            }
        }
    }

    print(setCount)
}
