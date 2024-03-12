//
//  Wordle.swift
//  Wordle
//
//  Created by Aryan on 4/3/22.
//

import Foundation
import UIKit

class Wordle: UIViewController
{
    @IBOutlet weak var Score: UILabel!
    @IBOutlet var letter: [UILabel]!
    @IBOutlet weak var guess: UITextField!
    @IBOutlet weak var checkguess: UIButton!
    var model = Model()
    var numguess=0
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getWord()
        Score.textColor = .black
        // Do any additional setup after loading the view.
        for l in letter{
            l.text=""
            l.backgroundColor = .lightGray
            l.textColor = .black
        }

    }
    @IBAction func CheckWord(_ sender: Any) {

        if(model.DoesExist(guess: guess.text!.uppercased())){
            print("here")
            var i = 0
            var characters = Array(guess.text!.uppercased())
            for l in characters{
                letter[i+(5*numguess)].text=String(l)
                i=i+1
            }
            if(model.Check(guess: guess.text!.uppercased())){
                Score.text="Cograts you won in \(numguess+1) attempt"
                Reset()
            }
            else{
                var yellowMatch=model.CheckYelloMatches(guess: guess.text!.uppercased())
                print(yellowMatch)
                var greenMatch=model.CheckGreenMatches(guess: guess.text!.uppercased())
                print(greenMatch)
                for i in yellowMatch{
                    letter[i+(5*numguess)].backgroundColor = .yellow
                }
                for i in greenMatch{
                    letter[i+(5*numguess)].backgroundColor = .green
                }
                numguess=numguess+1
                Score.text=""
            }
            if(numguess==5){
                Reset()
                Score.text="You lost. The word was \(model.TodayWord())"
            }
            //Score.text=""
        }
        else{
            Score.text="Word Does not Exist"
            //guess.text=""
        }
    }
    @IBAction func OnEdit(_ sender: Any) {
        var i = 0
        for l in Array(arrayLiteral: guess.text!){
            letter[i].text=l
            i=i+1
        }
    }
    
    func Reset() {

        model.getWord()
        guess.text=""
        for l in letter{
            l.backgroundColor = .lightGray
            l.text=""
        }
        numguess=0
    }
    

}
