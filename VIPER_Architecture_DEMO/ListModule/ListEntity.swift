//
//  ListEntity.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

// MARK: - User
typealias UserData = [User]

struct User: Codable, Equatable {
    let userId, id: Int?
    let title: String?
    let completed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id
        case title
        case completed
    }
}
