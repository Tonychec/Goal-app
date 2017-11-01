//
//  GoalTableViewCell.swift
//  goalPost-app
//
//  Created by Nomad on 10/29/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completeGoalView: UIView!
    
    func configureCell(goal: Goal) {
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompetionValue {
            self.completeGoalView.isHidden = false
        } else {
            self.completeGoalView.isHidden = true
        }
    }
}
