//
//  ViewController.swift
//  Swift Higher Order Function
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        findTheLongestName()
        

    }

    /** Map **/
    func mapExample() {
        //In map, the order of execution is not guaranteed in sequence
        let houseNames = ["Starks", "Lanniesters", "targaryens", "baratheon", "arryn"]
        let mappedHouseCount = houseNames.map{$0.count} //각각의 character length를 새준다.
        print("house character length", houseNames, mappedHouseCount)
        let upperCaseHouse = houseNames.map{$0.uppercased()}
        print("house uppercased", houseNames, upperCaseHouse)
    }
    
    func mapWithBoolean() {
        let grade: [Int] = [30, 45, 50, 100, 12, 28, 46, 31, 34]
        let boolVal: [Bool] = grade.map{$0 > 35 ? true : false}
        print(boolVal)
    }
    
    /** for each **/
    //for each는 array를 반납하지 않는다.
    func forEachExample() {
        //In for-each, the order is guaranteed.
        let houseNames = ["Starks", "Lanniesters", "targaryens", "baratheon", "arryn"]
        houseNames.forEach { (name) in
            print(name)
        }
        houseNames.forEach{print($0)}
        let uppercasedHouse = houseNames.forEach{$0.uppercased()}
        print(uppercasedHouse)
    }
    
    /** Compact Map **/
    //map with optional value
    func compactMapValue() {
        let place: [String?] = ["Winterfell", "highgarden", "vale", "iron", "islands", "essos", "andalos"]
        let printValue = place.map{$0}
        print(printValue) //Optional("Winterfell") ...
        
        //optional을 해제시켜줌
        let compactMapValue = place.compactMap{$0}
        print(compactMapValue) //"Winterfell", "highgarden"...
    }
    
    //practical compactMap Example, convert string number to int
    func parseStringIntoIntWithCompactMap() {
        let numArray: [String] = ["45", "60", "75", "Something random error", "15", "another error"]
        let integerArray: [Int] = numArray.compactMap{Int($0)}
        print(integerArray)
    }
    
    
    /** Filter **/
    func printEvenNumber() {
        let numbers = Array(1...100)
        let evenNumbers = numbers.filter{$0 % 2 == 0}
        print(evenNumbers)
    }
    
    func hasSuffix() {
        let name:[String] = ["jon snow" , "Arya Stark" , "Jamie Lanniester" , "Sansa Stark" , "Renly Barathon" , "Catelen Stark" , "Theon Grayjoy" ,"Ned Stark"]
        let starkNames = name.filter{$0.hasSuffix("Stark")}
        print(starkNames)
    }
    
    func arrayMinCharLength() {
        let name:[String] = ["jon snow" , "Arya Stark" , "Jamie Lanniester" , "Sansa Stark" , "Renly Barathon" , "Catelen Stark" , "Theon Grayjoy" ,"Ned Stark"]
        let arrayWith_min_10_char = name.filter{ $0.count > 10}
        print(arrayWith_min_10_char)
    }
    
    /** Sort **/
    func sortNumber() {
        let randomNumbers:[Int] = [1,3,45,6743,4673,435,4162,6657,2431,658,686,56,3456,8875,325,46,2,66537,6]
        let sortedNumber = randomNumbers.sorted()
        print(sortedNumber)
    }
    
    func sortAlphabet() {
        let randomAlphabet = ["V", "a", "C", "D", "E", "O"]
        let sortedAlphabet = randomAlphabet.sorted()
        print(sortedAlphabet)
    }

    func eventFirstSorted() {
        let randomNumbers:[Int] = [1,3,45,6743,4673,435,4162,6657,2431,658,686,56,3456,8875,325,46,2,66537,6]
        
        //a와 b는 각각 비교 대상
        let eventFirstSorted = randomNumbers.sorted { (a, b) -> Bool in
            return a % 2 == 0
        }
        
        print(eventFirstSorted)
        
    }
    
    /** Reduce , Practice it multiple times**/
    func sumOfNumbers() {
        let numbers:[Int] = [1,3,45,6743,4673,435,4162,6657,2431,658,686,56,3456,8875,325,46,2,66537,6]
        let sumOfNumbers = numbers.reduce(0, {$0 + $1})
        print(sumOfNumbers)
    }
    
    func characterHandling() {
        let name = ["Hello", "hahaha", "kkkkkk  "]
        //띄어쓰기를 모두 지워줌
        //$0 - 첫 번째 result
        //$1 - 두 번째 result
        let nameString = name.reduce("", {$0 + $1.replacingOccurrences(of: " ", with: "")})
        print("type of name :- \(type(of: name)) , type of nameString :-  \(type(of: nameString))")
        print(nameString)
    }
    
    func stringNumbers() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let stringNumbers = numbers.reduce("", {String($0) + String($1)})
        print(stringNumbers)
    }
    
    func getTotalCountOfStrings() {
        let strings = ["abc", "defgh", "ijklmnopqr", "st"]
        let totalCount = strings.reduce(0, {$0 + $1.count})
        print(totalCount)
    }
    
    func findTheLongestName() {
        let names = ["Starks", "Lanniesters", "targaryens", "baratheon", "arryn"]
        let longestName = names.reduce("", {$0.count > $1.count ? $0 : $1})
        print(longestName)
    }
    
}

