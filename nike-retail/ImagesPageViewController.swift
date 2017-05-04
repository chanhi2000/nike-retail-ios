//
//  UIPageViewController.swift
//  nike-retail
//
//  Created by LeeChan on 5/4/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

//protocol ImagesPageViewControllerDelegate: class {
//    func setupPageController(numberOfPages: Int)
//    func turnPageController(to index: Int)
//}

class ImagesPageViewController: UIPageViewController {
    
//    weak var pageVCDelegate: ImagesPageViewControllerDelegate?
    
    var images: [UIImage]?
//        = fetchFeeds().first!.images  // for testing purpose
    
    lazy var pageCtrl: UIPageControl = {
        let pgCtrl = UIPageControl()
        pgCtrl.tintColor = .gray
        pgCtrl.currentPageIndicatorTintColor = .darkGray
        pgCtrl.numberOfPages = (self.images?.count)!
        return pgCtrl
    }()
    
    lazy var vcontrollers: [UIViewController] = {
        var vcs = [UIViewController]()
        if let imgs = self.images {
            for img in imgs {
                let itemImgVC = ItemImageViewController()
                itemImgVC.image = img
                vcs.append(itemImgVC)
            }
        }
        
//        self.pageVCDelegate?.setupPageController(numberOfPages: vcs.count)
        
        return vcs
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        view.addSubview(pageCtrl)
        pageCtrl.anchor(nil, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        self.turnToPage(index: 0)
        // Do any additional setup after loading the view.
    }
    
    fileprivate func turnToPage(index : Int) {
        let vcontroller = vcontrollers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = vcontrollers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        configureDisplaying(viewController: vcontroller)
        
        setViewControllers([vcontroller], direction: direction, animated: true, completion: nil)
    }
    
    fileprivate func configureDisplaying(viewController: UIViewController) {
        for (index, vc) in vcontrollers.enumerated() {
            if viewController == vc {
                if let itemImageVC = viewController as? ItemImageViewController {
                    itemImageVC.image = images?[index]
//                    self.pageVCDelegate?.turnPageController(to: index)
                    pageCtrl.currentPage = index
                }
            }
        }
    }
}

extension ImagesPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = vcontrollers.index(of: viewController) {
            if index > 0 {
                return vcontrollers[index - 1]
            }
        }
        return vcontrollers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = vcontrollers.index(of: viewController) {
            if index < vcontrollers.count - 1 {
                return vcontrollers[index + 1]
            }
        }
        return vcontrollers.first
    }
}

extension ImagesPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! ItemImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! ItemImageViewController)
        }
    }
}

class ItemImageViewController: UIViewController {
    
    var image: UIImage? {
        didSet {
            itemImageView.image = image
        }
    }
    
    let itemImageView: UIImageView = {
        let imgv = UIImageView(image: #imageLiteral(resourceName: "t1"))
        imgv.contentMode = .scaleAspectFit
        imgv.clipsToBounds = true
        return imgv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImageView.image = image
        view.addSubview(itemImageView)
        itemImageView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}


