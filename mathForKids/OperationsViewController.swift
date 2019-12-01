//
//  OperationsViewController.swift
//  mathForKids
//
//  Created by TALHA AYAR on 30.11.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import UIKit

class OperationsViewController: UIViewController {

    @IBOutlet weak var fourthResult: UITextField!
    @IBOutlet weak var fourthNumberTwo: UILabel!
    @IBOutlet weak var fourthOperation: UILabel!
    @IBOutlet weak var fourthNumberOne: UILabel!
    @IBOutlet weak var thirdResult: UITextField!
    @IBOutlet weak var thirdNumberTwo: UILabel!
    @IBOutlet weak var thirdOperation: UILabel!
    @IBOutlet weak var thirdNumberOne: UILabel!
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
    
    var maxNumber = 0
    
    var numbers = [Int]()
    var operations = ["+", "-", "x", "/"]
    var selectedFirstOperation = ""
    var selectedSecondOperation = ""
    var selectedThirdOperation = ""
    var selectedFourthOperation = ""
    var firstExpectedAnswer = 0
    var secondExpectedAnswer = 0
    var thirdExpectedAnswer = 0
    var fourthExpectedAnswer = 0
    var score = 0 {
        didSet {
            scoreLabel.text = "Skor: \(score)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        if (firstResult == nil) || (secondResult == nil) || (thirdResult == nil) || (fourthResult == nil) {
            checkButton.isEnabled = false
        } else {
            checkButton.isEnabled = true
        }
        configureFirstOperation()
        configureSecondOperation()
        configureThirdOperation()
        configureFourthOperation()
    }
    
    func configureFirstOperation() {
        numbers.removeAll()
        firstResult.text = ""
        for i in 1...maxNumber {
            numbers.append(i)
        }
        numbers.shuffle()
        operations.shuffle()
        selectedFirstOperation = operations[0]
        firstOperation.text = selectedFirstOperation
        firstNumberOne.text = "\(numbers[0])"
        firstNumberTwo.text = "\(numbers[1])"
        if selectedFirstOperation == "-" {
            if numbers[0] < numbers[1] {
                configureFirstOperation()
            } else {
                firstExpectedAnswer = Int(firstNumberOne.text!)! - Int(firstNumberTwo.text!)!
            }
        } else if selectedFirstOperation == "+" {
            firstExpectedAnswer = Int(firstNumberOne.text!)! + Int(firstNumberTwo.text!)!
        } else if selectedFirstOperation == "x" {
            firstExpectedAnswer = Int(firstNumberOne.text!)! * Int(firstNumberTwo.text!)!
        } else if selectedFirstOperation == "/" {
            let secondNumber = Int(firstNumberTwo.text!)!
            if Int(firstNumberTwo.text!)! >= secondNumber {
            if Int(firstNumberOne.text!)! % secondNumber == 0 {
                firstExpectedAnswer = Int(firstNumberOne.text!)! / Int(firstNumberTwo.text!)!
            } else {
                configureFirstOperation()
                }
            } else {
                configureFirstOperation()
            }
        }
        
    }
    
    func configureSecondOperation() {
        numbers.removeAll()
        secondResult.text = ""
        for i in 1...maxNumber {
            numbers.append(i)
        }
        numbers.shuffle()
        operations.shuffle()
        selectedSecondOperation = operations[0]
        secondOperation.text = selectedSecondOperation
        secondNumberOne.text = "\(numbers[0])"
        secondNumberTwo.text = "\(numbers[1])"
        if selectedSecondOperation == "-" {
            if numbers[0] < numbers[1] {
                configureSecondOperation()
            } else {
                secondExpectedAnswer = Int(secondNumberOne.text!)! - Int(secondNumberTwo.text!)!
            }
        } else if selectedSecondOperation == "+" {
            secondExpectedAnswer = Int(secondNumberOne.text!)! + Int(secondNumberTwo.text!)!
        } else if selectedSecondOperation == "x" {
            secondExpectedAnswer = Int(secondNumberOne.text!)! * Int(secondNumberTwo.text!)!
        } else if selectedSecondOperation == "/" {
            let secondNumber = Int(secondNumberTwo.text!)!
            if Int(secondNumberOne.text!)! >= secondNumber {
            if Int(secondNumberOne.text!)! % secondNumber == 0 {
                secondExpectedAnswer = Int(secondNumberOne.text!)! / Int(secondNumberTwo.text!)!
            } else {
                configureSecondOperation()
                }
            } else {
                configureSecondOperation()
            }
        }
        
    }
    
    func configureThirdOperation() {
        numbers.removeAll()
        thirdResult.text = ""
        for i in 1...maxNumber {
            numbers.append(i)
        }
        numbers.shuffle()
        operations.shuffle()
        selectedThirdOperation = operations[0]
        thirdOperation.text = selectedThirdOperation
        thirdNumberOne.text = "\(numbers[0])"
        thirdNumberTwo.text = "\(numbers[1])"
        if selectedThirdOperation == "-" {
            if numbers[0] < numbers[1] {
                configureThirdOperation()
            } else {
                thirdExpectedAnswer = Int(thirdNumberOne.text!)! - Int(thirdNumberTwo.text!)!
            }
        } else if selectedThirdOperation == "+" {
            thirdExpectedAnswer = Int(thirdNumberOne.text!)! + Int(thirdNumberTwo.text!)!
        } else if selectedThirdOperation == "x" {
            thirdExpectedAnswer = Int(thirdNumberOne.text!)! * Int(thirdNumberTwo.text!)!
        } else if selectedThirdOperation == "/" {
            let secondNumber = Int(thirdNumberTwo.text!)!
            if Int(thirdNumberOne.text!)! >= secondNumber {
            if Int(thirdNumberOne.text!)! % secondNumber == 0 {
                thirdExpectedAnswer = Int(thirdNumberOne.text!)! / Int(thirdNumberTwo.text!)!
            } else {
                configureThirdOperation()
                }
            } else {
                configureThirdOperation()
            }
        }
        
    }
    
    func configureFourthOperation() {
        numbers.removeAll()
        fourthResult.text = ""
        for i in 1...maxNumber {
            numbers.append(i)
        }
        numbers.shuffle()
        operations.shuffle()
        selectedFourthOperation = operations[0]
        fourthOperation.text = selectedFourthOperation
        fourthNumberOne.text = "\(numbers[0])"
        fourthNumberTwo.text = "\(numbers[1])"
        if selectedFourthOperation == "-" {
            if numbers[0] < numbers[1] {
                configureFourthOperation()
            } else {
                fourthExpectedAnswer = Int(fourthNumberOne.text!)! - Int(fourthNumberTwo.text!)!
            }
        } else if selectedFourthOperation == "+" {
            fourthExpectedAnswer = Int(fourthNumberOne.text!)! + Int(fourthNumberTwo.text!)!
        } else if selectedFourthOperation == "x" {
            fourthExpectedAnswer = Int(fourthNumberOne.text!)! * Int(fourthNumberTwo.text!)!
        } else if selectedFourthOperation == "/" {
            let secondNumber = Int(fourthNumberTwo.text!)!
            if Int(fourthNumberOne.text!)! >= secondNumber {
            if Int(fourthNumberOne.text!)! % secondNumber == 0 {
                fourthExpectedAnswer = Int(fourthNumberOne.text!)! / Int(fourthNumberTwo.text!)!
            } else {
                configureFourthOperation()
                }
            } else {
                configureFourthOperation()
            }
        }
        
    }
    
    @IBAction func checkAction(_ sender: Any) {
        let resultOne = Int(firstResult.text!)
        let resultTwo = Int(secondResult.text!)
        let resultThree = Int(thirdResult.text!)
        let resultFour = Int(fourthResult.text!)
        if selectedFirstOperation == "+" {
            if firstResult.text != nil {
                if resultOne == firstExpectedAnswer && resultTwo == secondExpectedAnswer && resultThree == thirdExpectedAnswer && resultFour == fourthExpectedAnswer{
                    resultLabel.text = "İşlem Doğru"
                    score += 10
                    configureFirstOperation()
                    configureSecondOperation()
                    configureThirdOperation()
                    configureFourthOperation()
                } else {
                    if firstResult.text == "" || secondResult.text == "" || thirdResult.text == "" || fourthResult.text == "" {
                        resultLabel.text = "Cevap alanlarını boş bırakmayınız."
                    } else {
                        resultLabel.text = "Yanlış"
                        score -= 15
                    }
                }
            }
        } else if selectedFirstOperation == "-" {
            if firstResult.text != nil {
                if resultOne == firstExpectedAnswer && resultTwo == secondExpectedAnswer && resultThree == thirdExpectedAnswer && resultFour == fourthExpectedAnswer{
                    resultLabel.text = "İşlem Doğru"
                    score += 10
                    configureFirstOperation()
                    configureSecondOperation()
                    configureThirdOperation()
                    configureFourthOperation()
                } else {
                    if firstResult.text == "" || secondResult.text == "" || thirdResult.text == "" || fourthResult.text == "" {
                        resultLabel.text = "Cevap alanlarını boş bırakmayınız."
                    } else {
                        resultLabel.text = "Yanlış"
                        score -= 15
                    }
                }
            }
        } else if selectedFirstOperation == "x" {
            if firstResult.text != nil {
                if resultOne == firstExpectedAnswer && resultTwo == secondExpectedAnswer && resultThree == thirdExpectedAnswer && resultFour == fourthExpectedAnswer{
                    resultLabel.text = "İşlem Doğru"
                    score += 10
                    configureFirstOperation()
                    configureSecondOperation()
                    configureThirdOperation()
                    configureFourthOperation()
                } else {
                    if firstResult.text == "" || secondResult.text == "" || thirdResult.text == "" || fourthResult.text == ""  {
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
