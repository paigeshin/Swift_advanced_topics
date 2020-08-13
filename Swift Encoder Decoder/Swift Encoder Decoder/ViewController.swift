//
//  ViewController.swift
//  Swift Encoder Decoder
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

/***  JSON Handling ***/
// 1. decodable을 이용하는 방법
// 2. JSONSerialization을 이용하는 방법

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1. Object를 JSON Encoding할 것 => 원하면 jsonString으로 만들어서 읽을 수 있다.
        //2. Encoding한 데이터를 다시 Decoding할 수 있다.
        let employee: Employee = Employee(name: "kim", id: "kim123", salary: 54000)
        
        
        encodeData(obj: employee, completion: { (data) in
            decodeData(obj: employee, data: data)
        })
//        decodeData(data: employee)
    }

    func encodeData<T:Codable>(obj: T, completion: (Data) -> Void) {
        do {
            
            //요약, JSON Serialization from encoded data is possible
            
            /*** Swift Object to JSON ***/
            //JSON Encoding
            let data: Data = try JSONEncoder().encode(obj)
            print("encodedData:", data)
            completion(data)
            
            //JSON Serialization with `Data`
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                if let name = json["name"] as? String {
                    print("JSON Serialization:", name)
                }
            }
            
            //Make JSON String
            let jsonString: String? = String(data: data, encoding: String.Encoding.utf8)
            print("jsonString:", jsonString!)
            
            //Make JSON String to Data and read it
            let jsonDataFromString: Data = Data(jsonString!.utf8)
            if let json = try JSONSerialization.jsonObject(with: jsonDataFromString, options: []) as? [String: Any] {
                if let name = json["name"] as? String {
                    print("JSON Serialization from String:", name)
               }
            }
            
        } catch {
            print("encoding error", error.localizedDescription)
        }
        
    
        
    }
    
    func decodeData<T:Codable>(obj :T, data: Data) {
        do {
            let decodedObj = try JSONDecoder().decode(T.self, from: data)
            print("decodedData", decodedObj)
        } catch {
            print("decoding error", error.localizedDescription)
        }
        
    }
    
    
}

struct Employee: Codable {
    
    var name: String
    var id: String
    var salary: Int
    
}
