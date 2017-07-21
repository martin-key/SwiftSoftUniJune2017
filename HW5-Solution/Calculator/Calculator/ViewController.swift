//
//  ViewController.swift
//  Calculator
//
//  Created by Martin Kuvandzhiev on 7/21/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

enum Actions:String {
    case sum = "+"
    case diff = "-"
    case mult = "*"
    case div = "/"
}

enum Step {
    case firstNumber
    case secondNumber
    case eq
}

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var b1️⃣: RoundButton!
    @IBOutlet weak var b2️⃣: RoundButton!
    @IBOutlet weak var b3️⃣: RoundButton!
    @IBOutlet weak var b4️⃣: RoundButton!
    @IBOutlet weak var b5️⃣: RoundButton!
    @IBOutlet weak var b6️⃣: RoundButton!
    @IBOutlet weak var b7️⃣: RoundButton!
    @IBOutlet weak var b8️⃣: RoundButton!
    @IBOutlet weak var b9️⃣: RoundButton!
    @IBOutlet weak var b0️⃣: RoundButton!
    
    @IBOutlet weak var bPlus: RoundButton!
    @IBOutlet weak var bMinus: RoundButton!
    @IBOutlet weak var bMult: RoundButton!
    @IBOutlet weak var bDiv: RoundButton!
    @IBOutlet weak var bEq: RoundButton!
    @IBOutlet weak var bClear: RoundButton!
    
    var number1 = 0.0
    var number2 = 0.0
    var action:Actions = .sum // by default
    var step: Step = .firstNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func calculate(_ number1: Double, action: Actions, _ number2: Double) -> Double{
        switch action{
        case .sum:
            return number1 + number2
        case .diff:
            return number1 - number2
        case .mult:
            return number1 * number2
        case .div:
            return number1 / number2
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard var displayText = self.displayLabel.text else {
            print("Error. label.text shall not be nil. Stop execution.")
            return
        }
        
        switch sender {
        case b0️⃣, b1️⃣, b2️⃣, b3️⃣, b4️⃣, b5️⃣, b6️⃣, b7️⃣, b8️⃣, b9️⃣ :
            displayText += sender.currentTitle!
        case bPlus, bMinus, bMult, bDiv:
            if self.step == .firstNumber {
                number1 = Double(displayText)!
                self.step = .secondNumber
            }else{
                number2 = Double(displayText)!
            }
            action = Actions(rawValue: sender.currentTitle!)!
            displayText = ""
            
        case bClear:
            displayText = ""
            self.step = .firstNumber
            number1 = 0
            number2 = 0
            
        case bEq:
            number2 = Double(displayText)!
            number1 = self.calculate(number1, action: action, number2)
            displayText = "\(number1)"
        default:
            break
        }
        
        self.displayLabel.text = displayText
    }
    


}

