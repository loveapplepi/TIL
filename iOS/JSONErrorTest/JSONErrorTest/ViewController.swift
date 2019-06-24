//
//  ViewController.swift
//  JSONErrorTest
//
//  Created by Pi on 24/06/2019.
//  Copyright © 2019 applepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TestParse { (folder) in
            print(folder[0])
        }
        // Do any additional setup after loading the view.
    }
    
    func TestParse(completion: @escaping ([Folder]) -> ()) {
        let str_json = """
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
                "nickname": "aaa",
                "docs": {
                    "profile_image_url": "https://lphoto.jpg",
                    "default_folder_id": 7
                },
                "created_at": "2019-05-13T10:26:55.000Z",
                "updated_at": "2019-05-13T10:26:55.000Z"
            },
            "last_picture": {
                "id": 29,
                "folder_id": 7,
                "path_key": "dev/upload/e34/e3d.png",
                "created_at": "2019-05-13T11:54:41.000Z"
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
                "nickname": "a",
                "docs": {
                    "profile_image_url": "https://pororo.png",
                    "default_folder_id": 2
                },
                "created_at": "2019-05-03T06:27:15.000Z",
                "updated_at": "2019-05-03T06:27:15.000Z"
            },
            "last_picture": {
                "id": 35,
                "folder_id": 2,
                "path_key": "dev/upload/809/809f45c.png",
                "created_at": "2019-06-17T07:57:52.000Z"
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
                "nickname": "dfdf",
                "docs": {
                    "profile_image_url": "https://photo.jpg",
                    "default_folder_id": 1
                },
                "created_at": "2019-05-03T06:16:47.000Z",
                "updated_at": "2019-05-03T06:16:47.000Z"
            },
            "primary_picture": {
                "id": 5,
                "folder_id": 1,
                "path_key": "dev/upload/0b8/0b8c2ea0-7313-11e9-adfc-35e59b68f455.jpg",
                "created_at": "2019-05-10T11:02:06.000Z"
            },
            "last_picture": {
                "id": 27,
                "folder_id": 1,
                "path_key": "dev/upload/16b/16b4e200-7574-11e9-9f47-194b84db632d.png",
                "created_at": "2019-05-13T11:41:47.000Z"
            }
        },
        {
            "id": 15,
            "user_id": 37,
            "name": "default",
            "primary_picture_id": null,
            "pictures_count": 55,
            "created_at": "2019-06-21T06:41:38.000Z",
            "updated_at": "2019-06-21T06:47:13.000Z",
            "user": {
                "id": 37,
                "nickname": "hi hi hi",
                "docs": {
                    "profile_image_url": "https://photo.jpg",
                    "default_folder_id": 15
                },
                "created_at": "2019-06-21T06:41:38.000Z",
                "updated_at": "2019-06-21T11:55:53.000Z"
            },
            "last_picture": {}
        },
        {
            "id": 3,
            "user_id": 3,
            "name": "default",
            "primary_picture_id": null,
            "pictures_count": 1,
            "created_at": "2019-05-03T06:27:34.000Z",
            "updated_at": "2019-06-16T05:26:29.000Z",
            "user": {
                "id": 3,
                "nickname": "2222",
                "docs": {
                    "profile_image_url": "https://circle_pororo.png",
                    "default_folder_id": 3
                },
                "created_at": "2019-05-03T06:27:34.000Z",
                "updated_at": "2019-05-03T06:27:34.000Z"
            },
            "last_picture": {
                "id": 31,
                "folder_id": 3,
                "path_key": "dev/upload/8087.png",
                "created_at": "2019-06-16T05:26:29.000Z"
            }
        },
        {
            "id": 8,
            "user_id": 9,
            "name": "default",
            "primary_picture_id": null,
            "pictures_count": 110,
            "created_at": "2019-06-18T12:32:53.000Z",
            "updated_at": "2019-06-21T03:28:46.000Z",
            "user": {
                "id": 9,
                "nickname": "hi hi",
                "docs": {
                    "profile_image_url": "https://photo.jpg",
                    "default_folder_id": 8
                },
                "created_at": "2019-06-18T12:32:53.000Z",
                "updated_at": "2019-06-21T05:49:42.000Z"
            },
            "last_picture": {}
        }
    ]
}
"""

        //if let jsonString = String(data: str_json, encoding: .utf8) {
        let jsonString = str_json
            let decoder = JSONDecoder()
            let dataJson = jsonString.data(using: .utf8)
        do {
            let folderModel = try decoder.decode(RandomUserFolders.self, from: dataJson!)
            completion(folderModel.folders)
            
        }catch {
            print("Errrrrrooorrrr")
        }
    }




}


// MARK: - Empty
struct RandomUserFolders: Codable {
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
    let lastPicture: RandomPicture
    let primaryPicture: RandomPicture?
    
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
struct RandomPicture: Codable {
    let id, folderID: Int?
    let pathKey, createdAt: String?
    
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
