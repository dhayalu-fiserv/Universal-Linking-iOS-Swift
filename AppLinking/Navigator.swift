//
//  Navigator.swift
//  AppLinking
//
//  Created by Rajasekhar on 11/08/20.
//  Copyright © 2020 Rajasekhar. All rights reserved.
//

import UIKit

struct Navigator {
    var window : UIWindow
    
    func goToView(data: User) {
        if data.name != "" {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = mainStoryboard.instantiateViewController(withIdentifier: "CustomViewController") as! CustomViewController
            nextViewController.user = data
            window.rootViewController = nextViewController
            window.makeKeyAndVisible()
        }
       
    }
}
