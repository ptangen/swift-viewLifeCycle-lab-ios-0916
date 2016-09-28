//
//  ViewController.swift
//  FunWithViews
//
//  Created by Jim Campagno on 9/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var topLeft: UIView!
    @IBOutlet weak var middleLeft: UIView!
    @IBOutlet weak var bottomLeft: UIView!
    
    @IBOutlet weak var middleCenter: UIView!
    
    @IBOutlet weak var topRight: UIView!
    @IBOutlet weak var middleRight: UIView!
    @IBOutlet weak var bottomRight: UIView!

    @IBOutlet weak var result1: UILabel!
    @IBOutlet weak var result2: UILabel!
    @IBOutlet weak var result3: UILabel!
    @IBOutlet weak var result4: UILabel!
    @IBOutlet weak var result5: UILabel!
    @IBOutlet weak var result6: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the die
        resetDie()
        
        // hide the results
        resetResults()
    }
    
    var roll = 0;
    
    @IBAction func dieButtonTapped(_ sender: AnyObject) {
        print("result6.isHidden: \(result6.isHidden)")
        if result6.isHidden == true {
            roll = randomDiceRoll()
            print("roll: \(roll)")
            updateLabelWithRoll(roll: roll)
            rearrangeDie(roll: roll)
        } else {
            resetResults()
            resetDie()
        }
    }
    
    func resetDie(){
        topLeft.isHidden = true
        middleLeft.isHidden = true
        bottomLeft.isHidden = true
        
        middleCenter.isHidden = true
        
        topRight.isHidden = true
        middleRight.isHidden = true
        bottomRight.isHidden = true
    }
    
    func resetResults(){
        result1.isHidden = true
        result2.isHidden = true
        result3.isHidden = true
        result4.isHidden = true
        result5.isHidden = true
        result6.isHidden = true
    }
    
    func rearrangeDie(roll: Int){
        resetDie()
        if roll == 1 {
           middleCenter.isHidden = false
        } else if roll == 2 {
            middleLeft.isHidden = false
            middleRight.isHidden = false
        } else if roll == 3 {
            topLeft.isHidden = false
            middleCenter.isHidden = false
            bottomRight.isHidden = false
        } else if roll == 4 {
            topLeft.isHidden = false
            bottomLeft.isHidden = false
            bottomRight.isHidden = false
            topRight.isHidden = false
        } else if roll == 5 {
            topLeft.isHidden = false
            bottomLeft.isHidden = false
            middleCenter.isHidden = false
            bottomRight.isHidden = false
            topRight.isHidden = false
        } else if roll == 6 {
            topLeft.isHidden = false
            middleLeft.isHidden = false
            bottomLeft.isHidden = false
            bottomRight.isHidden = false
            middleRight.isHidden = false
            topRight.isHidden = false
        }
    }
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    
    func updateLabelWithRoll(roll: Int) {
        
        let diceScore = String(roll)
        
        if result1.isHidden {
            result1.text = diceScore
            result1.isHidden = false
        } else if result2.isHidden {
            result2.text = diceScore
            result2.isHidden = false
        } else if result3.isHidden {
            result3.text = diceScore
            result3.isHidden = false
        } else if result4.isHidden {
            result4.text = diceScore
            result4.isHidden = false
        } else if result5.isHidden {
            result5.text = diceScore
            result5.isHidden = false
        } else if result6.isHidden {
            result6.text = diceScore
            result6.isHidden = false
        }
    }

}
