//
//  ExploreSectionType.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 9/17/22.
//

import Foundation

enum ExploreSectionType: CaseIterable {
    case top250Movies
    case MostPopularMovies
    case MostPopularTVs
    var title: String {
        switch self{
        case .top250Movies:
            return "Top 250 Movies"
        case .MostPopularMovies:
            return "Most Popular Movies"
        case .MostPopularTVs:
            return "Most Popular TV shows"
        }
    }
}
