//
//  ViewController.swift
//  mathForKids
//
//  Created by TALHA AYAR on 30.11.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var secondResult: UITextField!
    @IBOutlet weak var secondNumberTwo: UILabel!
    @IBOutlet weak var secondOperation: UILabel!
    @IBOutlet weak var secondNumberOne: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstResult: UITextField!
    @IBOutlet weak var firstNumberTwo: UILabel!
    @IBOutlet weak var firstOperation: UILabel!
    @IBOutlet weak var firstNumberOne: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var numbersFrom1to10 = [Int]()
    var operations = ["+", "-"]
    var selectedFirstOperation = ""
    var selectedSecondOperation = ""
    var firstExpectedAnswer = 0
    var secondExpectedAnswer = 0
    var score = 0 {
        didSet {
            scoreLabel.text = "Skor: \(score)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        if (firstResult == nil) || (secondResult == nil) {
            checkButton.isEnabled = false
        } else {
            checkButton.isEnabled = true
        }
        configureFirstOperation()
        configureSecondOperation()
    }
    
    func configureFirstOperation() {
        numbersFrom1to10.removeAll()
        firstResult.text = ""
        for i in 1...10 {
            numbersFrom1to10.append(i)
        }
        numbersFrom1to10.shuffle()
        operations.shuffle()
        selectedFirstOperation = operations[0]
        firstOperation.text = selectedFirstOperation
        firstNumberOne.text = "\(numbersFrom1to10[0])"
        firstNumberTwo.text = "\(numbersFrom1to10[1])"
        if selectedFirstOperation == "-" {
            if numbersFrom1to10[0] < numbersFrom1to10[1] {
                configureFirstOperation()
            } else {
                firstExpectedAnswer = Int(firstNumberOne.text!)! - Int(firstNumberTwo.text!)!
            }
        } else {
            firstExpectedAnswer = Int(firstNumberOne.text!)! + Int(firstNumberTwo.text!)!
        }
        
    }
    
    func configureSecondOperation() {
        numbersFrom1to10.removeAll()
        secondResult.text = ""
        for i in 1...10 {
            numbersFrom1to10.append(i)
        }
        numbersFrom1to10.shuffle()
        operations.shuffle()
        selectedSecondOperation = operations[0]
        secondOperation.text = selectedSecondOperation
        secondNumberOne.text = "\(numbersFrom1to10[0])"
        secondNumberTwo.text = "\(numbersFrom1to10[1])"
        if selectedSecondOperation == "-" {
            if numbersFrom1to10[0] < numbersFrom1to10[1] {
                configureSecondOperation()
            } else {
                secondExpectedAnswer = Int(secondNumberOne.text!)! - Int(secondNumberTwo.text!)!
            }
        } else {
            secondExpectedAnswer = Int(secondNumberOne.text!)! + Int(secondNumberTwo.text!)!
        }
        
    }
    
    @IBAction func checkAction(_ sender: Any) {
        let resultOne = Int(firstResult.text!)
        let resultTwo = Int(secondResult.text!)
        if selectedFirstOperation == "+" {
            if firstResult.text != nil {
                if resultOne == firstExpectedAnswer &&  resultTwo == secondExpectedAnswer{
                    resultLabel.text = "İşlem Doğru"
                    score += 10
                    configureFirstOperation()
                    configureSecondOperation()
                } else {
                    if firstResult.text == "" || secondResult.text == "" {
                        resultLabel.text = "Cevap alanlarını boş bırakmayınız."
                    } else {
                        resultLabel.text = "Yanlış"
                        score -= 15
                    }
                }
            }
        } else {
            if firstResult.text != nil {
                if resultOne == firstExpectedAnswer && resultTwo == secondExpectedAnswer {
                    resultLabel.text = "İşlem Doğru"
                    score += 10
                    configureFirstOperation()
                    configureSecondOperation()
                } else {
                    if firstResult.text == "" || secondResult.text == "" {
                        resultLabel.text = "Cevap alanlarını boş bırakmayınız."
                    } else {
                        resultLabel.text = "Yanlış"
                        score -= 15
                    }
                }
            }
        }
        
    }
    

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
