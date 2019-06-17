//
//  ViewController.swift
//  URLSessionTest
//
//  Created by Pi on 13/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let urlString = ""
    private let tokenString = "x-auth-token"
    private var token: String = ""
    private let apiKeyString = "x-api-key"
    private let apiKeyValue = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        onHttpRequest()
    }
    
    func setImage(imageURL: String) {
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard error == nil && data != nil else {
                    if let err = error {
                        print(err.localizedDescription)
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.imageView.image = UIImage(data: imageData)
                    }
                    
                }
            }).resume()
        }
        
    }
    
    func getUserImage() {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(apiKeyValue, forHTTPHeaderField: apiKeyString)
            request.setValue(token, forHTTPHeaderField: tokenString)
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                        print(json)
                        let user = json["user"]
                        if let userDic = user as? Dictionary<String, Any> {
                            if let docs = userDic["docs"] as? Dictionary<String, Any> {
                                if let imageURL = docs["profile_image_url"] as? String {
                                    self.setImage(imageURL: imageURL)
                                }
                                
                            }
                        }
                        
//                        if let imageURL = json["profile_image_url"] as? String {
//                            self.setImage(imageURL: imageURL)
//                        }
                        
                        
                        
                        
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
        
        
        
    }
    
    func getKeyForUpload() {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(apiKeyValue, forHTTPHeaderField: apiKeyString)
            request.setValue(token, forHTTPHeaderField: tokenString)
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                guard error == nil && data != nil else {
                    if let err = error {
                        print(err.localizedDescription)
                    }
                    return
                }
                
                if let modelData = data {
                    if let strData = NSString(data: modelData, encoding: String.Encoding.utf8.rawValue) {
                        let str = String(strData)
//                        print("str!!\(str)")
                        DispatchQueue.main.async {
//                            print(str)
                        }
                    }
                } else {
                    print("data nil")
                }
            })
            task.resume()
        }
    }
    
    func onHttpRequest() {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("ziYrIdFgM2Av", forHTTPHeaderField: "x-api-key")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let parameters: [String: Any] = ["sns_id" : "hi"]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                        print(json)
//                        print("jwt \(json["jwt"])")
                        self.token = String(json["jwt"] as! String)
                        // handle json...
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()

//            let session = URLSession.shared
//            let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
//                guard error == nil && data != nil else {
//                    if let err = error {
//                        print(err.localizedDescription)
//                    }
//                    return
//                }
//
//                if let modelData = data {
//                    if let strData = NSString(data: modelData, encoding: String.Encoding.utf8.rawValue) {
//                        let str = String(strData)
//                        print("str!!\(str)")
//                        DispatchQueue.main.async {
//                            print(str)
//                        }
//                    }
//                } else {
//                    print("data nil")
//                }
//            })
//            task.resume()
            
        }
        
        
        
    }
    
    @IBAction func touchedButton(_ sender: Any) {
        getKeyForUpload()
        getUserImage()
    }
    
}


