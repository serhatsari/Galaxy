//
//  ViewController.swift
//  MyGalaxyOfAppleSdks
//
//  Created by Serhat Sarı on 26.06.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(speechKitAction))
        self.view.addGestureRecognizer(tap)
        self.view.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func speechKitAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SpeechKitViewController")
        self.present(controller, animated: true, completion: nil)
    }

}

