//
//  label.swift
//  MSconverter
//
//  Created by Alexander Nazarov on 31.03.2021.
//

import UIKit

class Label: UIView {
    
    var rub: Double?

    @IBAction func buttonOk(_ sender: Any) {
        
        
        
        //Проверка на текст
        if let text = usdText.text, let rubble = rub, !text.isEmpty
        {
            rubText.text = String(format:"%.2f", Double(text)! * rubble)
        } else {
            print("error")
        }
    }
    
    @IBOutlet weak var usdText: UITextField!
    
    @IBOutlet weak var rubText: UITextField!

}
