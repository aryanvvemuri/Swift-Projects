//
//  ViewController.swift
//  Wordle
//
//  Created by Aryan on 4/3/22.
//

import UIKit

class ViewController: UIViewController {
    var wordlist: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "dictionary", ofType: "txt") // file path for file "data.txt"
        let string = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).split(separator: "\n")
        print(string[0])
        for word in string{
            if(word.count==5){
                wordlist.append(String(word))
            }
        }
        print(wordlist)
    }


}

