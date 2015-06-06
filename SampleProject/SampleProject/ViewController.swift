//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 03/06/2015.
//  Copyright (c) 2015 Shamas Shahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkBoxButton: SSCheckBoxButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBoxButton.selected = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didSelectButton(sender: AnyObject) {
//        println("hello")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

