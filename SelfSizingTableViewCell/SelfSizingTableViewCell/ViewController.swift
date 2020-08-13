//
//  ViewController.swift
//  SelfSizingTableViewCell
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var customModels = [CustomCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 50
        
        customModels.append(CustomCellModel(topLabel: "aabadsvodsafvodskfods", bottomLabel: "asdjkfadsjfadsjfklajsdkf"))
        customModels.append(CustomCellModel(topLabel: "aabadsvodadfgadfsgadfsgafsgadsgdasgadsgadssafvodskfods", bottomLabel: "asdjkfadsjfadsjfklajsdkf"))
        customModels.append(CustomCellModel(topLabel: "aabadsvodsafvodgadfsharehrwkgnfdakslfjkldsajfkladsfadsfadsfadsfadsfadsfasdfasdfskfods", bottomLabel: "asdjkfadsjfadsjfklajsdkf"))
        customModels.append(CustomCellModel(topLabel: "aabadsvodsafvodskfoasdfadslfkadlskfopadskfopadskfopadksopfkaosdkfopasdkfoakdsopfkadsofkaodskfopds", bottomLabel: "asdjkfadsjfadsjfklajsdkf"))
        customModels.append(CustomCellModel(topLabel: "aabadsvodsafvodskfods", bottomLabel: "asdjkfadsjfadsjfklasdfadslkfadklsfjkadsjfkladsjfkadjsfkadsjfadsgadgadsfaajsdkfadfgadsjkfl;adskfkladsbgjkadshfkldsjklfadsklfhadklsfjkladsjfkladsjfkladsjfkl;adjsfkladjsklfjadsklfjakldsjfkl;adsjfk;ladsjfkladsjfkl;ajds;klfjadskl;fjakldsjfkl;adsjf;kladsjfkladsjfkladsjfkl;asdjkl;fjadsklfjakl;dsfjkl;adsjfkl;adsjfklajdlsk;fj"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CustomCell
        cell.topLabel.text = customModels[indexPath.row].topLabel
        cell.bottomLabel.text = customModels[indexPath.row].bottomLabel
        cell.isClicked = customModels[indexPath.row].isClicked
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        let clicked =  customModels[indexPath.row].isClicked
        if !clicked {
            customModels[indexPath.row].isClicked = true
            cell.isClicked = customModels[indexPath.row].isClicked
            cell.topLabel.numberOfLines = 0
            cell.bottomLabel.numberOfLines = 0
            tableView.beginUpdates()
            tableView.endUpdates()
            print("click!")
            print(indexPath.row, customModels[indexPath.row].isClicked)
        } else {
            customModels[indexPath.row].isClicked = false
            cell.isClicked = customModels[indexPath.row].isClicked
            cell.topLabel.numberOfLines = 1
            cell.bottomLabel.numberOfLines = 1
            tableView.beginUpdates()
            tableView.endUpdates()
            print("unclick!")
            print(indexPath.row, customModels[indexPath.row].isClicked)
        }
    }
    
    

}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    var isClicked: Bool?
    
}

struct CustomCellModel {
    
    var topLabel: String
    var bottomLabel: String
    var isClicked = false
    
}
