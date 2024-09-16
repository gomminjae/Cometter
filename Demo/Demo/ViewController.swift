//
//  ViewController.swift
//  Demo
//
//  Created by 권민재 on 9/16/24.
//

import UIKit
import Cometter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cometter = Cometter()
        view.addSubview(cometter)
        cometter.particleImage = UIImage(named: "sakura")
        cometter.enableGestures = [.pin]
        
        cometter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                    cometter.topAnchor.constraint(equalTo: view.topAnchor),
                    cometter.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    cometter.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    cometter.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
    
        // Do any additional setup after loading the view.
    }


}

