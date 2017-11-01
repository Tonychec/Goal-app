//
//  FinishGoalViewController.swift
//  goalPost-app
//
//  Created by Nomad on 10/30/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numberOfPoints: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        numberOfPoints.delegate = self
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalWasPressed(_ sender: Any) {
        if numberOfPoints.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompetionValue = Int32(numberOfPoints.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save \(error)")
            completion(false)
        }
    }
}
