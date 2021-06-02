//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by Iheb Rahali on 31.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    @IBAction func submit(_ sender: Any) {
        if let text = textField.text, text.isEmpty {
            showAlert(title: "oops", message: "Please input your username before continuing.")
        } else {
            if saveUserName(name: textField.text!) {
                showAlert(title: "Great", message: "Username saved.")
            } else {
                showAlert(title: "oops", message: "Failed to save your username, please try again.")
            }
        }
    }
    
    func saveUserName(name : String) -> Bool{
        let defaults = UserDefaults.standard
        defaults.setValue(name, forKey: "USER_NAME")
        return true
    }
    
    func setupUI() {
        view.backgroundColor = .white
        nextButton.backgroundColor = .systemBlue
        nextButton.tintColor = .white
        nextButton.titleLabel?.text = "Next"
        textField.backgroundColor = .lightGray
        textField.placeholder = "Username..."
    }
    
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

