//
//  Users.swift
//  GitFollowerProject
//
//  Created by HYUNG JOO LEE on 2020/01/21.
//  Copyright © 2020 HYUNG JOO LEE. All rights reserved.
//

import Foundation

struct Users: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var htmlUrl: String
    var createdAt: String
}
