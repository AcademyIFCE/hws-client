//
//  File.swift
//  
//
//  Created by Mateus on 31/08/22.
//

import Foundation

public struct Message: Decodable {
    let id: Int
    let user: String
    let text: String
}
