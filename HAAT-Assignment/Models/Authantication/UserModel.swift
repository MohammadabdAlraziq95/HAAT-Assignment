//
//  UserModel.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/28/22.
//

// MARK: - UserModel
struct UserModel: Codable {
    let error: Bool
    let msg: String
    let users: [User]
}
// MARK: - User
struct User: Codable {
    let username, phoneNumber, authCode: String
}
