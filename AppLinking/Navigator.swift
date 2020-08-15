//
//  Navigator.swift
//  AppLinking
//
//  Created by Rajasekhar on 11/08/20.
//  Copyright © 2020 Rajasekhar. All rights reserved.
//

import UIKit

struct RoutesType {
    let feed = "feed"
    let profile = "profile"
}

struct RouteKeys {
    let manager = "manager"
}

struct Navigator {
    var window : UIWindow
    var route = RoutesType()
    
    func getURLPath(url : URL) {
        print(url.pathComponents)
        print(url.lastPathComponent)
        print(url.relativePath)
        
        let lastPathComponent = url.lastPathComponent
        
        let siteName = url.pathComponents.count >= 2 ? url.pathComponents[2] : nil
        
        guard siteName != nil else { return }
        
        if url.relativePath.contains(RoutesType().feed) {
            if hasComponent(from: url) {
                let components = queryParameters(from: url)
                print(components) // ["date": "some date"]
                // Navigate to ...
            } else {
                print("No components")
                // Navigate to ...
            }
        }
        
        if url.relativePath.contains(RoutesType().profile) {
            if lastPathComponent == RouteKeys().manager {
                // Navigate to ...
            } else {
                // Navigate to ...
            }
        }
        
    }
    
    private func hasComponent(from url: URL) -> Bool {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        if let components = urlComponents?.queryItems, !components.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    private func queryParameters(from url: URL) -> [String: String] {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var queryParams = [String: String]()
        for queryItem: URLQueryItem in (urlComponents?.queryItems)! {
            if queryItem.value == nil {
                continue
            }
            queryParams[queryItem.name] = queryItem.value
        }
        return queryParams
    }
    
    func goToView(data: User) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = mainStoryboard.instantiateViewController(withIdentifier: "CustomViewController") as! CustomViewController
        nextViewController.user = data
        window.rootViewController = nextViewController
        window.makeKeyAndVisible()
    }
}
