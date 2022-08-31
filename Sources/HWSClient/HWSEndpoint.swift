//
//  File.swift
//  
//
//  Created by Mateus on 31/08/22.
//

import Foundation

enum HWSEndpoint: String {
    
    case inbox = "inbox.json"
    
    func url(for baseURL: URL) -> URL {
        return baseURL.appendingPathComponent(rawValue)
    }
    
}

extension HWSEndpoint: CaseIterable { }
