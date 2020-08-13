//
//  ViewController.swift
//  Swift Generic
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchPosts { (posts) in
//            posts.forEach{print($0.title)}
        }
        
        fetchComments { (comments) in
//            comments.forEach{print($0.email)}
        }
        
        /*** When you call generic function, you must give data type to your arugment ***/
        
        fetchGenericData(urlString: "https://jsonplaceholder.typicode.com/posts/") { (posts: [Post]) in
            posts.forEach({print($0.title)})
        }
        
        fetchGenericData(urlString: "https://jsonplaceholder.typicode.com/comments") { (comments: [Comment]) in
            comments.forEach({print($0.email)})
        }
        
    }

    func fetchPosts(completion: @escaping ([Post]) -> ()) {
        
        let urlString = "https://jsonplaceholder.typicode.com/posts/"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
        }.resume()
        
    }
    
    func fetchComments(completion: @escaping([Comment])-> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                completion(comments)
            } catch let jsonErr {
                print("Failed to decode josn:", jsonErr)
            }
        }.resume()
        
    }
    
    /*** Generic function ***/
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping(T) -> ()) {

        let urlString = urlString
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
        }.resume()
        
    }

}


struct Post: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}

struct Comment: Decodable {
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
}
