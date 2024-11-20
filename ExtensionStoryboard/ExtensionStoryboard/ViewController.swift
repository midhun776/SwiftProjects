//
//  ViewController.swift
//  ExtensionStoryboard
//
//  Created by DDUKK on 25/10/24.
//

import UIKit

class ViewController: UIViewController {

    var textVar: String?
    var newVar: String?
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textVar = String().getName(name: "Mimuu")
        if let testV = textVar{
            newVar = testV
            print(newVar ?? "")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController{
            vc.newText = newVar
            vc.delegate = self
        }
    }
    
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "nextPage", sender: nil)
    }
    
}

//MARK: - Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
//UIBezierPath - For making core animations
extension ViewController: SecondViewControllerDelegate{
    func sedName(name: String) {
        self.newVar = name
        label1.text = newVar
    }
}

extension String{
    func getName(name: String) -> String{
        return name
    }
}
