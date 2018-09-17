//
//  TurnViewController.swift
//  Turnos
//
//  Created by Vicente Andrés Cantú García on 9/16/18.
//  Copyright © 2018 equipo-rojo. All rights reserved.
//

import UIKit

class TurnViewController: UIViewController {

    @IBOutlet weak var turn: UILabel!
    
    var turnAssigned = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        turn.text = turnAssigned
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
