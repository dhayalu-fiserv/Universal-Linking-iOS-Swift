//
//  CustomViewController.swift
//  AppLinking
//
//  Created by Rajasekhar on 11/08/20.
//  Copyright © 2020 Rajasekhar. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageColor: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let user = user else {
            return
        }
        
        nameLabel.text = user.name
        ageLabel.text = user.age
        genderLabel.text = user.gender
    }

}
