//
//  CreateGoalViewController.swift
//  goalPost-app
//
//  Created by Nomad on 10/30/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortBtn: UIButton!
    @IBOutlet weak var longBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextBtn.bindToKeyboard()
        shortBtn.setSelectedCilor()
        longBtn.setDeselectedColor()
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalViewController else { return }
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController!.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortBtn.setSelectedCilor()
        longBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longBtn.setSelectedCilor()
        shortBtn.setDeselectedColor()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
