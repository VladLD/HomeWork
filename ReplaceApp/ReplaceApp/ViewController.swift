//
//  ViewController.swift
//  ReplaceApp
//
//  Created by Vlad Lapchynskyi on 07.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var searchWordField: UITextField!
    @IBOutlet weak var replaceWordField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var replaceButton: UIButton!
    
    @IBAction func replaceButtonTapped(_ sender: Any) {
        
        
        guard let text = textView.text, let searchWord = searchWordField.text, !text.isEmpty, !searchWord.isEmpty else {
            resultLabel.text = "Please enter text and search word"
            return
        }
        
        
        let replacedText = text.replacingOccurrences(of: searchWord, with: replaceWordField.text ?? "")
        
        
        let sentences = replacedText.split(separator: ".")
        var correctedSentences = [String]()
        for sentence in sentences {
            let trimmedSentence = sentence.trimmingCharacters(in: .whitespacesAndNewlines)
            if let firstChar = trimmedSentence.first, firstChar.isLowercase {
                let correctedSentence = firstChar.uppercased() + trimmedSentence.dropFirst()
                correctedSentences.append(correctedSentence)
            } else {
                correctedSentences.append(trimmedSentence)
            }
        }
        
        
        resultLabel.text = correctedSentences.joined(separator: ". ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        replaceButton.setTitleColor(.white, for: .normal)
        replaceButton.layer.cornerRadius = 9
        
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
        
        
        textView.delegate = self
        searchWordField.delegate = self
        replaceWordField.delegate = self
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}

