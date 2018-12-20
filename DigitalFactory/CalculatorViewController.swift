//
//  CalculatorViewController.swift
//  DigitalFactory
//
//  Created by stephanie Cappello on 12/15/18.
//  Copyright © 2018 stephanie Cappello. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var inputLbl: UILabel!
    @IBOutlet weak var outputLbl: UILabel!
    let inputValidator = InputValidator()
    var currExpressionStr: String = ""
    var resultStr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberBtnClicked(_ sender: UIButton){
        
    }
    
    @IBAction func decimalBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func operandBtnClicked(_ sender: UIButton){
        if sender.tag == 12{
            inputValidator.operatorValid(exp: currExpressionStr, operation: "/")
        }
    }
    
    @IBAction func clearBtnClicked(_ sender: UIButton) {
        currExpressionStr = ""
        resultStr = ""
    }
    
    @IBAction func trigFuncBtnClicked(_ sender: UIButton){
        
    }
    
}
