//
//  ExploreTop250MoviesCollectionViewCell.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 10/11/22.
//

import UIKit

class ExploreTop250MoviesCollectionViewCell: UICollectionViewCell {
    static let identifier = "ExploreTop250MoviesCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        backgroundColor = .red
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        imageView.frame = contentView.bounds
        label.frame = CGRect(x: 10, y: contentView.height - 5 - label.height, width: label.width, height: label.height)
        contentView.bringSubviewToFront(label)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    func configure(with viewModel: Top250MoviesViewModel) {
        imageView.image = viewModel.thumbnailImage
        label.text = viewModel.title
        
    }
    
}
