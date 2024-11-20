//
//  SecondViewController.swift
//  ExtensionStoryboard
//
//  Created by DDUKK on 25/10/24.
//

import UIKit

protocol SecondViewControllerDelegate  {
    func sedName(name: String)
}

class SecondViewController: UIViewController {
    var newText: String?
    var delegate: SecondViewControllerDelegate?

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textLabel.text = newText
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        delegate?.sedName(name: newText ?? "")
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
