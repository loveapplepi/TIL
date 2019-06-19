//
//  ViewController.swift
//  JSONEncoderTest
//
//  Created by Pi on 18/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var authModel = AuthModel(user: UserModel(nickname: "applepi", docs: AuthDocs(profileImageURL: "http//imageurl")), auth: Auth(snsID: "애플파이", snsAccessToken: "accesstokendfjkdfj"))

    override func viewDidLoad() {
        super.viewDidLoad()
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        let jsonData = try? encoder.encode(authModel)
        if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    }


    
    
}


// MARK: - AuthModel
struct AuthModel: Codable {
    let user: UserModel
    let auth: Auth
}

// MARK: - Auth
struct Auth: Codable {
    let snsID, snsAccessToken: String
    
    enum CodingKeys: String, CodingKey {
        case snsID = "sns_id"
        case snsAccessToken = "sns_access_token"
    }
}

// MARK: - User
struct UserModel: Codable {
    let nickname: String
    let docs: AuthDocs
}

// MARK: - Docs
struct AuthDocs: Codable {
    let profileImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case profileImageURL = "profile_image_url"
    }
}






