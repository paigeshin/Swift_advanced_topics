//
//  ViewController.swift
//  Swift_Closure_Examples
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
    }


     
    
}

//MARK: - Closure without argumentss
extension ViewController {
    
    func callClosureWithoutArguments() {
        //Trailing
        closureWithoutArguments {
            
        }
        //with name
        closureWithoutArguments(completion: {
            
        })
    }

    func closureWithoutArguments(completion: () -> Void) {
        completion()
    }
    
}

//MARK: - Closure with arguments
extension ViewController {
    
    func callClosureWithArguments() {
        
        closureWithArguments { (string, bool) in
            
        }
        
        closureWithArguments(completion: { (string, bool) in
            
        })
        
        
    }
    
    func closureWithArguments(completion: (String, Bool) -> Void) {
        completion("Success", true)
    }
    
    
    
}


//MARK: - Closure with return value
extension ViewController {
    
    func callClosureWithReturnValue(){
        
        closureWithReturnValue(completion: { (bool) in
            return true
        })
        
        closureWithReturnValue { (bool) -> Bool in
            return true
        }
        
    }
    
    
    func closureWithReturnValue(completion: (Bool) -> Bool) {
        let result = completion(true)
    }
    
}
