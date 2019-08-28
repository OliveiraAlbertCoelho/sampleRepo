//
//  people.swift
//  tab
//
//  Created by albert coelho oliveira on 8/27/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct People: Codable {
    let results: [Person]
    static func getPerson(from data: Data) throws -> [Person]{
        do {
            let human = try
            JSONDecoder().decode(People.self, from: data)
            return human.results
        }
        catch {
            throw jsonError.decondingError(error)
        }
    }
}
struct Person: Codable {
    let gender: String
    let name: fullName
    let location: address
    let email: String
    let dob: birtDay
    let phone: String
}
struct fullName: Codable {
    let first: String
    let last: String
}
struct address: Codable {
    let street: String
    let city: String
    let state: String
}
struct birtDay: Codable {
    let date: String
}
