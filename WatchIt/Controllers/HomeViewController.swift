//
//  ViewController.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/3/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        let button = UIButton(type: .roundedRect)
             button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
             button.setTitle("Test Crash", for: [])
             button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
             view.addSubview(button)
    }

    @objc func crashButtonTapped(_ sender: AnyObject) {
         let numbers = [0]
         let _ = numbers[1]
     }

}

