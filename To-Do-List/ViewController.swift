//
//  ViewController.swift
//  To-Do-List
//
//  Created by Arystan on 24.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }
    @IBAction func addTask(_ sender: Any) {
        
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        let phoneNumber = phoneTextField.text!
        
        var newTask = Person(name: name, surname: surname, phoneNumber: phoneNumber)
        
        
        do {
            if let data = UserDefaults.standard.data(forKey: "taskItemArray") {
                
                var array = try JSONDecoder().decode([Person].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            } else {
                let encodedata = try JSONEncoder().encode([newTask])
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            }
        } catch {
            print("ubable to encode \(error)")
        }
        
        nameTextField.text = ""
        surnameTextField.text = ""
        phoneTextField.text = ""
        
    }
    

}

