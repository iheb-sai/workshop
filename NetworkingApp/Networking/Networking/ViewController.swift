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
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data , response, error) in
            //check errors
            if error == nil && data != nil {
                //parse json
                let decoder = JSONDecoder()
                
                do {
                    let dataFeed = try decoder.decode(Model.self, from: data!)
                    print("This is the result --> \n \(dataFeed)")
                    self.model = dataFeed
                    self.image.load(url: URL(string:self.model!.message) ?? URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZk3y06bcooRBu224-A4IaLv3hRrK6AkTPjQ&usqp=CAU")!)
                    
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
