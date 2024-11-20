//
//  ViewController.swift
//  GesturesStoryboard
//
//  Created by DDUKK on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //("Touch Began!")
        let touch = touches.first!
        if touch.view == textView {
            print("Text Touched")
            return
        }
        print("Touch began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touch Moved!")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touch Ended!")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touch Cancelled!")
    }


}

