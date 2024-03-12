//
//  ViewController.swift
//  AddOne
//
//  Created by Aryan on 1/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var addone: UITextField!
    var timer=Timer()
    var point=0
    var timeremaining=60
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .blue
        setRand()
        points.text="0"
        time.text="1:00"
        // Do any additional setup after loading the view.
    }
    @IBAction func timeStart(_ sender: Any) {
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }
    @IBAction func onTxtChange(_ sender: Any) {
        var txtchange=(addone.text! as NSString).integerValue
        var randnum=(number.text! as NSString).integerValue+1111
        
        if txtchange==randnum
        {
            point+=1
            points.text = String(point)
            setRand()
        }
    }
    func setRand(){
        number.text = String(Int.random(in: 1000...9999))
        //time.text=""
        addone.text=""
    }
    @objc func UpdateTimer(){
        timeremaining=timeremaining-1
        if timeremaining==60{
            time.text="1:00"
        }
        else{
            time.text="0:"+String(timeremaining)
        }
    }
    

}

