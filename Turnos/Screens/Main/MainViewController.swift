
//
//  MainViewController.swift
//  Turnos
//
//  Created by Vicente Andrés Cantú García on 9/16/18.
//  Copyright © 2018 equipo-rojo. All rights reserved.
//

import UIKit
import KeychainSwift

class MainViewController: UIViewController, AssignTurn {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !(KeychainSwift().getBool("getPermission") ?? false) {
            let login = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
            present(login!, animated: false, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        KeychainSwift().set(false, forKey: "getPermission")
        let login = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
        present(login!, animated: true, completion: nil)
    }
    
    @IBAction func registerTurn(_ sender: Any) {
        RestApi.newTurn(email: "viente@example.com", onResponse: { turn in
            self.performSegue(withIdentifier: "turn", sender: turn.turno)
        }, onError: {
            print("ONERROR")
        }, onNoData: {
            print("ONNODATA")
        })
    }
    
    // MARK: - AssignTurn
    
    func turnAssigned(turn: String) {
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TurnViewController {
            vc.turnAssigned = sender as! String
        }
    }

}
