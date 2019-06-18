//
//  ViewController.swift
//  CodableTest
//
//  Created by Pi on 17/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let jsonString = """

{
    "folders": [
        {
            "id": 7,
            "user_id": 7,
            "name": "default",
            "primary_picture_id": null,
            "pictures_count": 2,
            "created_at": "2019-05-13T10:26:55.000Z",
            "updated_at": "2019-05-13T11:54:41.000Z",
            "user": {
                "id": 7,
                "nickname": "apple",
                "docs": {
                "profile_image_url": "https://~~~~photo.jpg",
                    "default_folder_id": 7
                },
                "created_at": "2019-05-13T10:26:55.000Z",
                "updated_at": "2019-05-13T10:26:55.000Z"
            },
            "last_picture": {
                "id": 29,
                "folder_id": 7,
                "path_key": "dev/upload/photo.png",
                "created_at": "2019-05-13T11:54:41.000Z"
            }
        },
        {
            "id": 1,
            "user_id": 1,
            "name": "default",
            "primary_picture_id": 5,
            "pictures_count": 25,
            "created_at": "2019-05-03T06:16:47.000Z",
            "updated_at": "2019-05-13T11:41:47.000Z",
            "user": {
                "id": 1,
                "nickname": "김후리",
                "docs": {
                    "profile_image_url": "https://aaaaa.photo.jpg",
                    "default_folder_id": 1
                },
                "created_at": "2019-05-03T06:16:47.000Z",
                "updated_at": "2019-05-03T06:16:47.000Z"
            },
            "primary_picture": {
                "id": 5,
                "folder_id": 1,
                "path_key": "dev/upload/55.jpg",
                "created_at": "2019-05-10T11:02:06.000Z"
            },
            "last_picture": {
                "id": 27,
                "folder_id": 1,
                "path_key": "dev/upload/11.png",
                "created_at": "2019-05-13T11:41:47.000Z"
            }
        },
        {
            "id": 2,
            "user_id": 2,
            "name": "default",
            "primary_picture_id": null,
            "pictures_count": 6,
            "created_at": "2019-05-03T06:27:15.000Z",
            "updated_at": "2019-06-17T07:57:52.000Z",
            "user": {
                "id": 2,
                "nickname": "하트",
                "docs": {
                    "profile_image_url": "https://sdfdfdfcircle_pororo.png",
                    "default_folder_id": 2
                },
                "created_at": "2019-05-03T06:27:15.000Z",
                "updated_at": "2019-05-03T06:27:15.000Z"
            },
            "last_picture": {
                "id": 35,
                "folder_id": 2,
                "path_key": "dev/upload/11111.png",
                "created_at": "2019-06-17T07:57:52.000Z"
            }
        }
    ]
}

"""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let decoder = JSONDecoder()
        var data = jsonString.data(using: .utf8)
        if let data = data, let folders = try? decoder.decode(UserFolders.self, from: data) {
            var userfolder = folders.folders
            for folder in userfolder {
                print(folder.name)
            }
        }
    }
    
    
    
}

// MARK: - Welcome
struct UserFolders: Codable {
    let folders: [Folder]
}

// MARK: - Folder
struct Folder: Codable {
    let id, userID: Int
    let name: String
    let primaryPictureID: Int?
    let picturesCount: Int
    let createdAt, updatedAt: String
    let user: User
    let lastPicture: Picture
    let primaryPicture: Picture?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case name
        case primaryPictureID = "primary_picture_id"
        case picturesCount = "pictures_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case user
        case lastPicture = "last_picture"
        case primaryPicture = "primary_picture"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let id, folderID: Int
    let pathKey, createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case folderID = "folder_id"
        case pathKey = "path_key"
        case createdAt = "created_at"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let nickname: String
    let docs: Docs
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, nickname, docs
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Docs
struct Docs: Codable {
    let profileImageURL: String
    let defaultFolderID: Int
    
    enum CodingKeys: String, CodingKey {
        case profileImageURL = "profile_image_url"
        case defaultFolderID = "default_folder_id"
    }
}
