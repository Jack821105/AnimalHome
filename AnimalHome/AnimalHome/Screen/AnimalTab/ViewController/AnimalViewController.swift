//
//  AnimalViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit
import SnapKit
import FirebaseRemoteConfig
import GoogleMobileAds

// MARK: - StoryboardInstantiable

extension AnimalViewController: StoryboardInstantiable {}

/// 動物主頁
class AnimalViewController: UIViewController {
    
    
    
    // MARK: - UI Properties
    
    private lazy var laodingView: UIActivityIndicatorView = {
        return UIActivityIndicatorView()
    }()
    
    private lazy var bannerView: GADBannerView = {
        let view = GADBannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        view.adUnitID = Constants.adUnitsID
        view.rootViewController = self
        view.delegate = self
        return view
    }()
    
    private lazy var tabView: AnimalTypeTabView = {
        let view = AnimalTypeTabView()
        view.delegate = self
        return view
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
    
    // MARK: - Properties
    
    private lazy var dogListVC: DogListViewController = {
        let vc = DogListViewController.instantiate()
        return vc
    }()
    
    private lazy var catListVC: CatListViewController = {
        let vc = CatListViewController.instantiate()
        return vc
    }()
    
    private lazy var otherListVC: OtherListViewController = {
        let vc = OtherListViewController.instantiate()
        return vc
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        return [dogListVC, catListVC, otherListVC]
    }()
    
    private var currentTabIndex: Int = 0
    
    private let pageTypes: [AnimalType] = [.dog, .cat, .other]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "浪浪之家"
        self.view.backgroundColor = .clear
        setupTabView()
        setupPageViewController()
        setupBannerView()
        handleViewControllerDirection(index: currentTabIndex, animated: false)
        bannerView.load(GADRequest())
    }
    
    // MARK: - SetupUI
    
    private func setupTabView() {
        let pageTitles = pageTypes.map {
            $0.getTitle()
        }
        tabView.configure(with: pageTitles)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabView)
        tabView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tabView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupPageViewController() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.didMove(toParent: self)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageViewController.view.topAnchor.constraint(equalTo: tabView.bottomAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupBannerView() {
        self.pageViewController.view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.pageViewController.view).offset(0)
            make.height.lessThanOrEqualTo(40)
        }
    }
    
}



// MARK: - GADBannerViewDelegate

extension AnimalViewController: GADBannerViewDelegate {
    
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        // A unified native ad has loaded, and can be displayed.
        
        Logger.log("JACK DEV 成功")
    }
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        // The adLoader has finished loading ads, and a new request can be sent.
        Logger.log("JACK DEV1 失敗 \(error)")
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        Logger.log("JACK DEV2 失敗 \(error)")
    }
    
}


// MARK: - UIPageViewControllerDataSource

extension AnimalViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex - 1
        
        guard viewControllers.indices.contains(nextIndex) else {
            return nil
        }
        
        return viewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        
        guard viewControllers.indices.contains(nextIndex) else {
            return nil
        }
        
        return viewControllers[nextIndex]
    }
    
}
 
// MARK: - UIPageViewControllerDelegate

extension AnimalViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed,
           let visibleViewController = pageViewController.viewControllers?.first,
           let index = viewControllers.firstIndex(of: visibleViewController) {
             
            tabView.scrollToTabButton(for: index)
            
            currentTabIndex = index
        }
    }
    
}

extension AnimalViewController: AnimalTypeTabViewDelegate {
 
    func didTapTabButon(for index: Int) {
        
        handleViewControllerDirection(index: index, animated: true)
        
    }
    
    
    private func handleViewControllerDirection(index: Int, animated: Bool) {
        
        guard viewControllers.indices.contains(index) else { return }
              
        let viewController = viewControllers[index]
        
        let direction: UIPageViewController.NavigationDirection = index > currentTabIndex ? .forward : .reverse
        
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                            
            self?.pageViewController.setViewControllers([viewController], direction: direction, animated: animated) { finished in
                
                if finished {
                    self?.tabView.scrollToTabButton(for: index)
                    self?.currentTabIndex = index
                }
            }
        }
    }
    
}


enum AnimalType {
    
    case dog
    
    case cat
    
    case other
    
    func getTitle() -> String {
        switch self {
        case .dog:
            return "狗"
        case .cat:
            return "貓"
        case .other:
            return "其他"
        }
    }
}
