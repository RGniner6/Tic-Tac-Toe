//
//  MainMenuViewController.swift
//  Tic Tac Toe
//
//  Created by Rahul Gururaj on 21/2/18.
//  Copyright © 2018 Rahul Gururaj. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "goToGame", sender: self)
        if name1.text != "" {
            player1 = name1.text!
        }
        else {
            player1 = "Player 1"
        }

        if name2.text != "" {
            player2 = name2.text!
        }
        else {
            player2 = "Player 2"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
