//
//  ViewController.swift
//  SimplyShake
//
//  Created by robert on 2/24/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shakeL: UILabel!
    
    @IBAction func ClearB(sender: UIButton) {
        self.shakeL.text = "რა გენანები ?  Shake me"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
        self.shakeL.textColor = UIColor.whiteColor()
        self.shakeL.text = "ოოო რა კარგია"
        self.shakeL.backgroundColor = UIColor.redColor()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            self.shakeL.backgroundColor = UIColor.whiteColor()
            self.shakeL.text = "Sheiken"
            self.shakeL.textColor = UIColor.blackColor()
        }
    }
   
}

