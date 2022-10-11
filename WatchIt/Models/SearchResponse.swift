//
//  SearchResponse.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 9/16/22.
//

import Foundation

struct SearchResponse: Codable {
    let searchType: String
    let expression: String
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let id: String
    let image: String
    let title: String
    let description: String
}
