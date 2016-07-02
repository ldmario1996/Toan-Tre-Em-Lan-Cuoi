//
//  ViewController.swift
//  Toan tre em lai
//
//  Created by Thang Le on 6/20/16.
//  Copyright © 2016 Thang Le. All rights reserved.
//
// yeu cau co thoi gian tinh gio(ok)
// random vi tri tra loi dung(ok)
// 3 so phai khac nhau(ok)
//co random phep nhan(x)(ok)
// if the answer is right + 1 second
// if the answer is wrong -1 second
// if timer = 0 disable button(ok)
// change background for button(ok)
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    var timer = 30
    var result = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
        randomGenerator()
        button1.setBackgroundImage(UIImage(named: "note1.png"), forState: .Normal)
        button2.setBackgroundImage(UIImage(named: "note2.png"), forState: .Normal)
        button3.setBackgroundImage(UIImage(named: "note3.png"), forState: .Normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var timeNumber: UILabel!
    @IBOutlet weak var rightNum: UILabel!
    @IBOutlet weak var wrongNum: UILabel!
    @IBOutlet weak var labelMultiply: UILabel!
    @IBAction func buttonAction(sender: UIButton) {
        if (Int(sender.currentTitle!)! == result )
        {
        rightNum.text = String(Int(rightNum.text! )! + 1)
        timer+=2
        }
        else{
        wrongNum.text = String(Int(wrongNum.text! )! + 1)
        timer-=2
        }
        randomGenerator()
    }
    func randomGenerator(){
        var random1 = Int(arc4random_uniform(4)) + 1
        var random2 = Int(arc4random_uniform(4)) + 1
        //random ra so tu 1 toi 4
        // nhet 2 so vao label
        let randomDau = Int(arc4random_uniform(4))
        if (randomDau == 0)
        {
            labelMultiply.text = "+"
        }
        if (randomDau == 1) {
           labelMultiply.text = "-"
        }
        if (randomDau == 2)
        {
           labelMultiply.text = "x"
        }
        if (randomDau == 3)
        {
            labelMultiply.text = ":"
            while (random1 % random2 != 0){
                // khi ma phep chia xuat hien thi randomgenerator so moi cho toi khi random1 chia het cho random2
                random1 = Int(arc4random_uniform(4)) + 1
                random2 = Int(arc4random_uniform(4)) + 1
            }
        }
        label1.text = String(random1)
        label2.text = String(random2)
        numGenerator(random1, randomB: random2)
    }
    func numGenerator(randomA: Int, randomB: Int){
        let randomSo = arc4random_uniform(3)
        // goi so 0 1 2 de random vi tri dap an dung
        var randomC = arc4random_uniform(16) + 1
        var randomD = arc4random_uniform(16) + 1
        // goi so tu 1 toi 16 de nhet vao 2 vi tri con lai
        while(Int(randomC) == calcu(randomA, p2: randomB)){
            randomC = arc4random_uniform(16) + 1
        // randomC phai khac gia tri dung
        }
        while(Int(randomD) == calcu(randomA, p2: randomB) || randomD == randomC){
            randomD = arc4random_uniform(16) + 1
        //randomD phai khac gia tri dung va khac gia tri C
        }
        if randomSo == 0{
            button1.setTitle(String(calcu(randomA,p2:randomB)), forState: .Normal)
            button2.setTitle(String(randomC),forState: .Normal)
            button3.setTitle(String(randomD),forState: .Normal)
        }
        if randomSo == 1{
            button2.setTitle(String(calcu(randomA,p2:randomB)), forState: .Normal)
            button1.setTitle(String(randomC),forState: .Normal)
            button3.setTitle(String(randomD),forState: .Normal)
        }
        if randomSo == 2{
            button3.setTitle(String(calcu(randomA,p2:randomB)), forState: .Normal)
            button1.setTitle(String(randomC),forState: .Normal)
            button2.setTitle(String(randomD),forState: .Normal)
        }
}
    func calcu(p1: Int, p2: Int) ->Int
    {
        // random ra 3 truong hop dau
        if(labelMultiply.text == "x"){
            result = p1*p2
        }
        else if(labelMultiply.text == "+"){
            result = p1+p2
        }
        else if(labelMultiply.text == "-"){
            result = p1-p2
        }
        else if(labelMultiply.text == ":"){
            result = p1/p2
        }
        print(result)
        return result
    }
    func countdown(){
//        dem nguoc
        if(timer > 0){
            timer--
            timeNumber.text = String(timer)
            if(timer==0){
            button1.userInteractionEnabled = false
            button2.userInteractionEnabled = false
            button3.userInteractionEnabled = false
            //disable the button when timer reach 0
            }
        }
    }
}






