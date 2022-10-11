//
//  ExploreViewController.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/3/22.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Search..."
        bar.layer.cornerRadius = 8
        bar.layer.masksToBounds = true
        return bar
    }()
    private var sections = [ExploreSection]()
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupSearchBar()
        setupCollectionView()
        configModels()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        collectionView?.frame = view.bounds
    }
    
    func configModels() {
        var cells = [ExploreCell]()
        for x in 0...1000 {
            let cell = ExploreCell.banner(viewModel: ExploreBannerViewModel(thumbnailImage: nil, description: "test", handler: {
                
            }))
            cells.append(cell)
        }
        sections.append(ExploreSection(type: .MostPopularMovies, cells: cells))
    }
    
    func setupSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { section, _ -> NSCollectionLayoutSection? in
            return self.layout(for: section)
        }
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .blue
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    func layout(for section: Int) -> NSCollectionLayoutSection {
        
        let sectionType = sections[section].type
        
        switch sectionType {
            
        case .top250Movies:
            break
        case .MostPopularMovies:
            break
        case .MostPopularTVs:
            break
        }
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.90),
            heightDimension: .fractionalHeight(1)
        )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.80), heightDimension: .absolute(200)), subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        return sectionLayout
    }
    
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = sections[indexPath.section].cells[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell", for: indexPath
        )
        cell.backgroundColor = .purple
        return cell
    }
}

extension ExploreViewController: UISearchBarDelegate {
    
}
