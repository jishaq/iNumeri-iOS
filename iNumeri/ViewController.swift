//
//  ViewController.swift
//  iNumeri
//
//  Created by Jeff Ishaq on 12/7/16.
//  Copyright © 2016 Snowdog Software. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    let numberLowerBound: UInt32 = 0
    let numberUpperBound: UInt32 = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextNumber(_ sender: UIButton) {
        let nextNumber: UInt32 = arc4random_uniform(numberUpperBound)
        numberTextField.text = "\(nextNumber)"
    }

    @IBAction func sayIt(_ sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: numberTextField.text!)
        myUtterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
        myUtterance.rate = 0.3
        synth.speak(myUtterance)
    }
}

