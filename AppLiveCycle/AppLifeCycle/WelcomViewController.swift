//
//  WelcomViewController.swift
//  AppLifeCycle
//
//  Created by Iheb Rahali on 31.05.21.
//

import UIKit

class WelcomViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
        view.backgroundColor = .white
        okButton.backgroundColor = .systemBlue
        okButton.tintColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.text = "Hi \(fetchUserName())"
    }
    
    func fetchUserName() -> String {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "USER_NAME") as! String
    }
    
    @IBAction func reset(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "USER_NAME")
    }
    
    
}
