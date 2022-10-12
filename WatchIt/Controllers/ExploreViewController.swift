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
        for _ in 1...1000 {
            let cell = ExploreCell.Top250Movies(viewModel: Top250MoviesViewModel(thumbnailImage: UIImage(named: "test"), title: "hey", description: "test", handler: {
                
            }))
            cells.append(cell)
        }
        
        var posts = [ExploreCell]()
        
        for _ in 1...40 {
            posts.append(
                ExploreCell.Top250Movies(viewModel: Top250MoviesViewModel(thumbnailImage: UIImage(named: "test"), title: "testTitleTop250", description: "", handler: {
                    
                }))
            )
        }
        // Top 250 movies
        sections.append(ExploreSection(
            type: .top250Movies,
            cells: posts
        )
        )
        
        // Popular Movies
        sections.append(ExploreSection(
            type: .MostPopularMovies,
            cells: [.MostPopularMovies(viewModel: MostPopularMoviesViewModel(thumbnailImage: UIImage(named: "test"), title: "testMostPopularMovie", description: "", handler: {
                
            })),
                    .MostPopularMovies(viewModel: MostPopularMoviesViewModel(thumbnailImage: UIImage(named: "test"), title: "testTitleTop250", description: "", handler: {
                        
                    })),
                    .MostPopularMovies(viewModel: MostPopularMoviesViewModel(thumbnailImage: UIImage(named: "test"), title: "testTitleTop250", description: "", handler: {
                    }))]
        )
        )
        // TV Shows
        sections.append(ExploreSection(
            type: .MostPopularTVs,
            cells: [.MostPopularTvShows(viewModel: MostPopularTVShowsViewModel(thumbnailImage: UIImage(named: "test"), title: "testmostPopularMovie", description: "", handler: {
                
            }))]
        )
        )
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
        collectionView.register(ExploreTop250MoviesCollectionViewCell.self,
                                forCellWithReuseIdentifier: ExploreTop250MoviesCollectionViewCell.identifier)
        collectionView.register(ExploreTopTvShowsCollectionViewCell.self, forCellWithReuseIdentifier: ExploreTopTvShowsCollectionViewCell.identifier)
        collectionView.register(ExploreMostPopularMoviesCollectionViewCell.self, forCellWithReuseIdentifier: ExploreMostPopularMoviesCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .blue
        view.addSubview(collectionView)
        self.collectionView = collectionView
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
        
        switch model {
            
        case .Top250Movies(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreTop250MoviesCollectionViewCell.identifier, for: indexPath
            ) as? ExploreTop250MoviesCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: ExploreTop250MoviesCollectionViewCell.identifier, for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        case .MostPopularMovies(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreMostPopularMoviesCollectionViewCell.identifier, for: indexPath
            ) as? ExploreMostPopularMoviesCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: ExploreMostPopularMoviesCollectionViewCell.identifier, for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        case .MostPopularTvShows(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreTopTvShowsCollectionViewCell.identifier, for: indexPath
            ) as? ExploreTopTvShowsCollectionViewCell else {
                return collectionView.dequeueReusableCell(
                    withReuseIdentifier: ExploreTopTvShowsCollectionViewCell.identifier, for: indexPath
                )
            }
            cell.configure(with: viewModel)
            return cell
        case .post(let viewModel):
            break
        case .user(let viewModel):
            break
        }
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell", for: indexPath
        )
        cell.backgroundColor = .purple
        return cell
    }
}

extension ExploreViewController: UISearchBarDelegate {
    
}

extension ExploreViewController {
    func layout(for section: Int) -> NSCollectionLayoutSection {
        
        let sectionType = sections[section].type
        
        switch sectionType {
            
        case .top250Movies:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.90),
                heightDimension: .fractionalHeight(1)
            )
            )
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(250), heightDimension: .absolute(200)), subitem: item, count: 1)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.80), heightDimension: .absolute(200)), subitems: [verticalGroup])
            
            let sectionLayout = NSCollectionLayoutSection(group: group)
            sectionLayout.orthogonalScrollingBehavior = .continuous
            
            return sectionLayout
        case .MostPopularMovies:
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
        case .MostPopularTVs:
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
}
