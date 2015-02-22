//
//  ViewController.swift
//  SimpleDrawing
//
//  Created by robert on 2/23/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var drawView: DrawV!
    
    @IBAction func clearB(sender: UIButton) {
        var theDrawView = drawView as DrawV
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

