//
//  decode.swift
//  tab
//
//  Created by albert coelho oliveira on 8/27/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

enum jsonError: Error {
    case decondingError(Error)
}
struct Color: Codable {
    let colors: [ColorValue]
    
    static func getColor(from data: Data) throws -> [ColorValue]{
        do {
            let colors = try
                JSONDecoder().decode(Color.self, from: data)
            return colors.colors
        }
        catch {
            throw jsonError.decondingError(error)
        }
    }
}

struct ColorValue: Codable {
    let hex: HexWrapper
    let rgb: Rgb
    let name: name
}

struct HexWrapper: Codable{
    let value: String
}
struct Rgb: Codable {
    let fraction: FractionWrapper
}
struct FractionWrapper: Codable{
    let r: Double
    let g: Double
    let b: Double
}

struct name: Codable {
    let value: String
}
