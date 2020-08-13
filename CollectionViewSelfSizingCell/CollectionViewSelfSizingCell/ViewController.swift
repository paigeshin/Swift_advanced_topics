//
//  ViewController.swift
//  CollectionViewSelfSizingCell
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var collectionView: UICollectionView!
    var chapters = [CustomCellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chapters.append(CustomCellModel(title: "Hello Hello Hello Hello Hello", name: "new cell new cell", chapter: "hihihihihi"))
        chapters.append(CustomCellModel(title: "Hello Hello Hello Hello Hello", name: "new cell new cell", chapter: "hihihihihi"))
        chapters.append(CustomCellModel(title: "Hello Hello Hello Hello Hello", name: "new cell new cell new cell new cell new cell new cell new cell new cell", chapter: "hihihihihi"))
        chapters.append(CustomCellModel(title: "Hello Hello Hello Hello Hello, Hello Hello Hello Hello Hello, Hello Hello Hello Hello Hello", name: "new cell new cell", chapter: "hihihihihi"))
        chapters.append(CustomCellModel(title: "Hello Hello Hello Hello Hello", name: "new cell new cell", chapter: "hihihihihi"))
        
        /***
        On iOS 13, CollectionView default configuration is set to be dynamic, so you don't actually need the code below
        ***/
        
 // IMPORTANT: this is the key to make your cells auto-sizing
//         if let collectionViewLayout = collectionView
//            .collectionViewLayout as? UICollectionViewFlowLayout {
//             collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//         }

        
        
        
    }
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let model = chapters[indexPath.row]
        cell.chapterLabel.text = model.chapter
        cell.nameLabel.text = model.name
        cell.titleLabel.text = model.title
        //필수
//        cell.contentView.layoutIfNeeded()
        
        
        return cell
    }
    
    //이 메소드를 호출하지 않으면 곧바로 rendering이 안된다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.contentSize.height)
    }

}

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        mainView.translatesAutoresizingMaskIntoConstraints = false
//        mainView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        //필수
        self.layoutIfNeeded()
    }
    
}

struct CustomCellModel {
    
    var title: String
    var name: String
    var chapter: String
    
}
