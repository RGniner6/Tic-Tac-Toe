//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Rahul Gururaj on 12/2/18.
//  Copyright © 2018 Rahul Gururaj. All rights reserved.
//

import UIKit
//Global variables for player names
var player1 = ""
var player2 = ""

class ViewController: UIViewController {
    var currentPlayer = 1
    var boardState = [0,0,0,0,0,0,0,0,0]
    var isGameActive :Bool = true
    var isWinner :Bool = false //To disable board when there's a winner
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] //Indices that represent wins
    @IBOutlet weak var playerLabel: UILabel!
    
    
     //Called everytime one of the tic tac toe buttons are pressed
    @IBAction func action(_ sender: AnyObject) {
        
        //Check if position has been clicked yet
        if boardState[sender.tag-1] == 0 && isGameActive {
            if currentPlayer == 1 {
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: UIControlState())
                boardState[sender.tag-1] = currentPlayer
                currentPlayer = 2
                playerLabel.text = player2+"'s turn"
            }
            else
            {
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: UIControlState())
                boardState[sender.tag-1] = currentPlayer
                currentPlayer = 1
                playerLabel.text = player1+"'s turn"
            }
        }
        
        /*
        Winning combinations have to be so
        1. First position of the combination has been clicked on
        2. First and second positions are clicked on by the same player
        3. Second and third positions are clicked on by the same player
        */
        for combination in winningCombinations {
            if boardState[combination[0]] != 0 && boardState[combination[0]] == boardState[combination[1]] && boardState[combination[2]] == boardState[combination[1]] {
                isGameActive = false
                
                if boardState[combination[0]] == 1 {
                    playerLabel.text = player1+" wins"
                    isWinner = true
                }
                else {
                    playerLabel.text = player2+" wins"
                    isWinner = true
                }
                playAgainButton.isHidden = false
            }
            
        }
        
        //Assume it's a draw
        isGameActive = false
        
        //Ruleout a draw by checking if there's still an empty position
        for i in boardState {
            if i == 0 && !isWinner {
                isGameActive = true
                break
                
            }
        }
        
        //If all squares have been clicked & there's no winner, it's a draw
        if !isGameActive && !isWinner {
            playerLabel.text = "It's a draw"
            playAgainButton.isHidden = false
        }
        
    }
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgainButton(_ sender: Any) {
        boardState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isGameActive = true
        currentPlayer = 1
        isWinner = false
        
        playAgainButton.isHidden = true
        playerLabel.text = "Start!"
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
   
    //Transition to the main menu
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

