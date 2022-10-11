//
//  ExploreCell.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 9/17/22.
//

import Foundation
import UIKit

enum ExploreCell {
    case banner(viewModel: ExploreBannerViewModel)
    case post(viewModel: String)
    case user(viewModel: ExploreUserViewModel)
}

struct ExploreBannerViewModel {
    let thumbnailImage: UIImage?
    let description: String
    let handler: (() -> Void)
}

struct ExploreUserViewModel {
    let profileImage: URL?
    let username: String
    let followCount: Int
    let handler: (() -> Void)
}

