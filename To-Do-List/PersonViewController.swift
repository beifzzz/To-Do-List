//
//  PersonViewController.swift
//  To-Do-List
//
//  Created by Arystan on 24.10.2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    
    var person = Person()
    var arrayPerson: [Person] = []
    var index = 0
    
    @IBOutlet weak var personNameTextFiled: UITextField!
    @IBOutlet weak var personSurnameTextfield: UITextField!
    @IBOutlet weak var personNumberTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personSurnameTextfield.text = person.surname
        personNameTextFiled.text = person.name
        personNumberTextField.text = person.phoneNumber
        
        
    }
    
    
    @IBAction func changeButtonPressed(_ sender: Any) {
        
        person.name = personNameTextFiled.text ?? ""
        person.surname = personSurnameTextfield.text ?? ""
        person.phoneNumber = personNumberTextField.text ?? ""
        
        arrayPerson[index] = person
        
        do {
            let data = try JSONEncoder().encode(arrayPerson)
            UserDefaults.standard.set(data, forKey: "taskItemArray")
        } catch {
            print("Unable to encode: \(error)")
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
