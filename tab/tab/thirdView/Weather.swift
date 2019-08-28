//
//  Weather.swift
//  tab
//
//  Created by albert coelho oliveira on 8/28/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let list: [userWeather]
    static func getPerson(from data: Data) throws -> [userWeather]{
        do {
            let temp = try
        JSONDecoder().decode(Weather.self, from: data)
            return temp.list
        }
        catch {
            throw jsonError.decondingError(error)
        }
    }
}
struct userWeather: Codable {
    let name: String
    let main: temperature
    let weather: [info]
}
struct temperature: Codable {
    let temp: Double
}
struct info: Codable {
    let description: String
}
