//
//  HomeViewController.swift
//  mathForKids
//
//  Created by TALHA AYAR on 30.11.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func chooseEasy(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OperationsViewController") as! OperationsViewController
        vc.maxNumber = 10
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func chooseMedium(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OperationsViewController") as! OperationsViewController
        vc.maxNumber = 20
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func chooseHard(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OperationsViewController") as! OperationsViewController
        vc.maxNumber = 100
        self.present(vc, animated: true, completion: nil)
    }
    
}
