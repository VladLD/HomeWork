//
//  AddTaskViewController.swift
//  ToDoListApp
//
//  Created by Vlad Lapchynskyi on 21.02.2023.
//

import UIKit

protocol AddTaskDelegate: AnyObject {
    func addTask(name: String, description: String)
}

class AddTaskViewController: UIViewController {
    weak var delegate: AddTaskDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
            
    }
    
    private func configure() {
        
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 9
        
    }
    
    @IBAction func saveTask(_ sender: Any) {
        guard let name = nameField.text, !name.isEmpty,
              let description = descriptionField.text, !description.isEmpty
        else {
            return
        }
        delegate?.addTask(name: name, description: description)
        dismiss(animated: true, completion: nil)
    }
}
