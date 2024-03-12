//
//  Model.swift
//  Wordle
//
//  Created by Aryan on 4/3/22.
//

import Foundation

class Model{
    var wordofday = ""
    var wordlist: [String] = []
    func getWord() -> String {
        
        let path = Bundle.main.path(forResource: "dictionary", ofType: "txt") // file path for file "data.txt"
        let string = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).split(separator: "\n")
        print(string[0])
        for word in string{
            if(word.count==5){
                wordlist.append(String(word))
            }
        }
        //print(wordlist)
        wordofday=String(wordlist[Int.random(in: 0 ..< wordlist.count)])
        print(wordofday)
        return wordofday
    }
    func DoesExist(guess:String) -> Bool {
        print(guess)
        return wordlist.contains(guess)
    }
    
    func TodayWord() -> String {
        return wordofday
    }
    func Check(guess:String) -> Bool {
        print(TodayWord())
        return guess==TodayWord()
        
    }
    func CheckGreenMatches(guess:String) -> [Int] {
        var greenMatches=[Int]()
        var i=0
        //print(Array(TodayWord()))
        for letter in Array(TodayWord()){
            if(letter==Array(guess)[i]){
                greenMatches.append(i)
            }
            i=i+1
                
        }
        return greenMatches
    }
    
    func CheckYelloMatches(guess:String) -> [Int] {
        var yellowMatch=[Int]()
        var i=0
        for letter in Array(guess){
            if(Array(TodayWord()).contains(letter)){
                yellowMatch.append(i)
            }
            i=i+1
                
        }
        return yellowMatch
    }

}
