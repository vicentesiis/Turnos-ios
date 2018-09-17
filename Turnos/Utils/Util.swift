//
//  Util.swift
//  Turnos
//
//  Created by Vicente Andrés Cantú García on 9/16/18.
//  Copyright © 2018 equipo-rojo. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func message(message:String!, action: @escaping ()->Void = {}) -> UIAlertController {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default){
            alertAction in
            action()
        }
        alertController.addAction(okAction)
        return alertController
    }
    
    static func message(title: String? = nil, message:String!, actions: [UIAlertAction]) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions{
            alertController.addAction(action)
        }
        return alertController
    }
    
    static func message(title: String!, message:String!, action: @escaping () -> Void = {}) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) {
            alertAction in
            action()
        }
        alertController.addAction(okAction)
        return alertController
    }
    
    static func dataToString(_ value: Data) -> String{
        let string = String(data: value, encoding: String.Encoding.utf8)
        return string!
    }
}
