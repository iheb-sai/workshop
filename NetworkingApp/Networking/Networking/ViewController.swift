//
//  ViewController.swift
//  Networking
//
//  Created by Iheb Rahali on 01.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    var model : Model?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var randomizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomImage()
        setupUI()
    }
    
    func setupUI(){
        randomizeButton.backgroundColor = .systemBlue
        randomizeButton.tintColor = .white
    }
    
    func randomImage(){
        //Step1: Create a URL
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        //Step2:Create a request
        let request = URLRequest(url: url)
        //Step3: Create and Start a task
        let task = URLSession.shared.dataTask(with: request) { (data , response, error) in
            //check errors
            if error == nil && data != nil {
                //Step4: Handle results
                
                do {
                    let decoder = JSONDecoder()
                    let dataFeed = try decoder.decode(Model.self, from: data!)
                    print("This is the result --> \n \(dataFeed)")
                    DispatchQueue.main.async {
                        self.model = dataFeed
                        self.image.load(url: URL(string:self.model!.message) ?? URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZk3y06bcooRBu224-A4IaLv3hRrK6AkTPjQ&usqp=CAU")!)
                    }
                    
                    
                } catch {
                    print("Error : \n \(error)")
                }
            }
        }
        task.resume()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        randomImage()
    }
    
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
