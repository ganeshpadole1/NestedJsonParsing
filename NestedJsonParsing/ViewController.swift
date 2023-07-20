//
//  ViewController.swift
//  NestedJsonParsing
//
//  Created by Ganesh on 20/07/23.
//

import UIKit

class ViewController: UIViewController {

    let baseURL = "https://jsonplaceholder.typicode.com/users"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.getResponse(url: baseURL) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

