//
//  ViewController.swift
//  WatchIt
//
//  Created by MattHew Phraxayavong on 8/3/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let HorizontalScrollView:  UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .brown
        scrollView.isPagingEnabled = true
        return scrollView
    }()

    let pageController:UIPageViewController =  {
        UIPageViewController(transitionStyle: .scroll,
                                              navigationOrientation: .vertical,
                                              options: [:])
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        view.addSubview(HorizontalScrollView)
        setupForYouMoviePosts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HorizontalScrollView.frame = view.bounds
    }
    
    private func setupForYouMoviePosts() {
        HorizontalScrollView.contentSize = CGSize(width: view.width * 2, height: view.height * 2)
        let vc = UIViewController()
        vc.view.backgroundColor = .purple
        
        
        
        pageController.setViewControllers([vc],
                                          direction: .forward,
                                          animated: false,
                                          completion: nil
        )
        pageController.dataSource = self
        
        HorizontalScrollView.addSubview(pageController.view)
        pageController.view.frame = view.bounds
        addChild(pageController)
        pageController.didMove(toParent: self)
    }
    



}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = [UIColor.red, UIColor.blue, UIColor.brown].randomElement()
        return vc
        
    }
}
