//
//  ExploreCell.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 9/17/22.
//

import Foundation
import UIKit

enum ExploreCell {
    case Top250Movies(viewModel: Top250MoviesViewModel)
    case MostPopularMovies(viewModel: MostPopularMoviesViewModel)
    case MostPopularTvShows(viewModel: MostPopularTVShowsViewModel)
    case post(viewModel: String)
    case user(viewModel: ExploreUserViewModel)
}

struct Top250MoviesViewModel {
    let thumbnailImage: UIImage?
    let title: String
    let description: String
    let handler: (() -> Void)
}

struct MostPopularMoviesViewModel {
    let thumbnailImage: UIImage?
    let title: String
    let description: String
    let handler: (() -> Void)
}

struct MostPopularTVShowsViewModel {
    let thumbnailImage: UIImage?
    let title: String
    let description: String
    let handler: (() -> Void)
}

struct ExploreUserViewModel {
    let profileImage: URL?
    let username: String
    let followCount: Int
    let handler: (() -> Void)
}

