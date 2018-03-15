//
//  ViewController.swift
//  calculator-reitokirihara
//
//  Created by UCode on 3/14/18.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var isTypingNumber = false;
    var firstNumber = Float(0.0);
    var secondNumber = Float(0.0);
    var operation = "";
    var isRad: Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var modeDisplay: UILabel!
    
    @IBAction func numberTapped(_ sender: AnyObject) {
        let number = sender.currentTitle!;
        
        if isTypingNumber {
            calculatorDisplay.text = calculatorDisplay.text! + number!;
        } else {
            calculatorDisplay.text = number!;
            isTypingNumber = true;
        }
    }
    
    @IBAction func calculationTapped(_ sender: AnyObject) {
        isTypingNumber = false;
        firstNumber = Float(calculatorDisplay.text!)!;
        operation = sender.currentTitle as! String;
    }
    
    @IBAction func equalsTapped(_ sender: Any) {
        isTypingNumber = false;
        var result: Float = 0;
        secondNumber = Float(calculatorDisplay.text!)!;
        
        if operation == "+" {
            result = firstNumber + secondNumber;
        } else if operation == "-" {
            result = firstNumber - secondNumber;
        } else if operation == "*" {
            result = firstNumber * secondNumber;
        } else if operation == "/" {
            result = firstNumber / secondNumber;
        } else{
            if !isRad{
                secondNumber = secondNumber/57.2958;
            }
            if operation == "sin" {
                result = sin(Float(secondNumber));
            } else if operation == "cos" {
                result = cos(Float(secondNumber));
            } else if operation == "tan" {
                result = tan(Float(secondNumber));
            }
        }
        
        calculatorDisplay.text = "\(result)";
    }
    @IBAction func trigFunctions(_ sender: AnyObject) {
        isTypingNumber = false
        operation = sender.currentTitle as! String;
    }
    @IBAction func allClear(_ sender: Any) {
        calculatorDisplay.text = "";
        isTypingNumber = false;
    }
    
    @IBAction func changeToRad(_ sender: Any) {
        modeDisplay.text = "Rad";
        isRad = true;
    }
    
    @IBAction func changeToDeg(_ sender: Any) {
        modeDisplay.text = "Deg";
        isRad = false;
    }
}

