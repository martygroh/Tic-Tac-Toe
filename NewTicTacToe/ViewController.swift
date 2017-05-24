//
//  ViewController.swift
//  NewTicTacToe
//
//  Created by Mgroh on 12/19/16.
//  Copyright © 2016 Mgroh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
var labelIsArray = [GridLabel]()
var xTurn = true
var gameOver = false

override func viewDidLoad() {
    super.viewDidLoad()
    labelIsArray.append(gridLabel0)
    labelIsArray.append(gridLabel1)
    labelIsArray.append(gridLabel2)
    labelIsArray.append(gridLabel3)
    labelIsArray.append(gridLabel4)
    labelIsArray.append(gridLabel5)
    labelIsArray.append(gridLabel6)
    labelIsArray.append(gridLabel7)
    labelIsArray.append(gridLabel8)
}

func checkForWinner() {
    // check first row (0,1,2)
    if labelIsArray[0].text != "" &&
        labelIsArray[0].text == labelIsArray[1].text &&
        labelIsArray[1].text == labelIsArray[2].text {
        displayWinningMessage(message: "\(labelIsArray[0].text!) is the winner!")
    }
        
        // check second row (3,4,5)
    else if labelIsArray[3].text != "" &&
        labelIsArray[3].text == labelIsArray[4].text &&
        labelIsArray[4].text == labelIsArray[5].text {
        displayWinningMessage(message: "\(labelIsArray[3].text!) is the winner!")
    }
        
        // check third row (6,7,8)
    else if labelIsArray[6].text != "" &&
        labelIsArray[6].text == labelIsArray[7].text &&
        labelIsArray[7].text == labelIsArray[8].text {
        displayWinningMessage(message: "\(labelIsArray[6].text!) is the winner!")
    }
        
        
        // check first column (0,3,6)
    else if labelIsArray[0].text != "" &&
        labelIsArray[0].text == labelIsArray[3].text &&
        labelIsArray[3].text == labelIsArray[6].text {
        displayWinningMessage(message: "\(labelIsArray[0].text!) is the winner!")
    }
        
        // check second column (1,4,7)
    else if labelIsArray[1].text != "" &&
        labelIsArray[1].text == labelIsArray[4].text &&
        labelIsArray[4].text == labelIsArray[7].text {
        displayWinningMessage(message: "\(labelIsArray[1].text!) is the winner!")
    }
        
        // check third column (2,5,8)
    else if labelIsArray[2].text != "" &&
        labelIsArray[2].text == labelIsArray[5].text &&
        labelIsArray[5].text == labelIsArray[8].text {
        displayWinningMessage(message: "\(labelIsArray[2].text!) is the winner!")
    }
        
        // check upper left to bottom right diagonal (0,4,8)
    else if labelIsArray[0].text != "" &&
        labelIsArray[0].text == labelIsArray[4].text &&
        labelIsArray[4].text == labelIsArray[8].text {
        displayWinningMessage(message: "\(labelIsArray[0].text!) is the winner!")
    }
        
        // check bottom right to upper left diagonal (6,4,2)
    else if labelIsArray[2].text != "" &&
        labelIsArray[2].text == labelIsArray[4].text &&
        labelIsArray[4].text == labelIsArray[6].text {
        displayWinningMessage(message: "\(labelIsArray[6].text!) is the winner!")
    }
}

func resetGame() {
    for label in labelIsArray {
        label.text = ""
        label.canTap = true
    }
    xTurn = true
    gameOver = false
}

func displayWinningMessage(message: String) {
    let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Reset", style: .default){
        (action) -> Void in self.resetGame()
    }
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
    gameOver = true
}


@IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
    //print ("tapped somewhere")
    if gameOver {
        return
        
    }
    
    var canPlay = false
    for label in labelIsArray {
        if label.frame.contains(sender.location(in: backgroundView)) {
            if label.canTap {
                if(xTurn){
                    label.text = "X"
                }
                else {
                    label.text = "O"
                }
                xTurn = !xTurn
                label.canTap = false
                checkForWinner()
            }
        }
        if label.canTap {
            canPlay = true
        }
    }
    if !canPlay && !gameOver {
        displayWinningMessage(message: "Cats game")
        }
    }
}


