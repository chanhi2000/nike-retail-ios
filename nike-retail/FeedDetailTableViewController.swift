//
//  FeedDetailTableViewController.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class FeedDetailTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var selectedFeed: Feed!
    var feeds: [Feed]?
    
    lazy var imgsPageVC: ImagesPageViewController = {
        let vc = ImagesPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
//    let imagesHeaderView: ImagesHeaderView = {
//        let v = ImagesHeaderView()
//        return v
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = selectedFeed.name
        navigationController?.navigationBar.topItem?.title = "" // UI: removes back button's text
        
        addChildViewController(imgsPageVC)
        setupTableView()
    }
    
    struct TableCell {
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let itemDetailCell = "ItemDetailCell"                    // cell 0
        static let buyButtonCell = "BuyButtonCell"                      // cell 1
        static let productDetailCell = "ProductDetailsCell"             // cell 2
        static let suggestionsCell = "SuggestionsCell"                  // cell 3
    }
    
    fileprivate func setupTableView() {
        tableView.separatorInset = .zero
        tableView.register(FeedDetailCell.self, forCellReuseIdentifier: TableCell.itemDetailCell)
        tableView.register(BuyButtonCell.self, forCellReuseIdentifier: TableCell.buyButtonCell)
        tableView.register(ProductDetailCell.self, forCellReuseIdentifier: TableCell.productDetailCell)
        tableView.register(SuggestionsCell.self, forCellReuseIdentifier: TableCell.suggestionsCell)
    }
    
    
}

extension FeedDetailTableViewController
{
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vc = imgsPageVC
//        vc.pageVCDelegate = 
        vc.images = selectedFeed.images
        return vc.view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreenWidth
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 0 - item detail cell
        // 1 - buy button
        // 2 - item full details button cell
        // 3 - suggestion cell
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.itemDetailCell, for: indexPath) as! FeedDetailCell
            cell.feed = selectedFeed
            cell.selectionStyle = .none
            return cell
        } else if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.buyButtonCell, for: indexPath) as! BuyButtonCell
            cell.feed = selectedFeed
            cell.selectionStyle = .none
            return cell
        } else if indexPath.item == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.suggestionsCell, for: indexPath) as! SuggestionsCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == 3 {
            guard let cell = cell as? SuggestionsCell else {  return  }
            cell.suggestionCollectionView.dataSource = self
            cell.suggestionCollectionView.delegate = self
            cell.suggestionCollectionView.reloadData()
            cell.suggestionCollectionView.isScrollEnabled = false
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 2*36 + 120
        } else if indexPath.row == 1 || indexPath.row == 2 {
            return 40.5 + 2*12
        } else if indexPath.row == 3 {
            return tableView.bounds.width + 68
        } else {
            print(UITableViewAutomaticDimension)
            return UITableViewAutomaticDimension
        }
    }
}

extension FeedDetailTableViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.suggestionsCell, for: indexPath) as! SuggestionCVCell
        let feeds = self.feeds
        cell.image = feeds?[indexPath.item].images.first
        return cell
    }
}

extension FeedDetailTableViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 2.5
        let itemWidth = (UIScreenWidth - 5) / 2.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreenWidth/2, height: UIScreenWidth/2)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsetsMake(0, 0, 0, 0)
//    }
}

