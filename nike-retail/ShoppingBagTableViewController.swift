//
//  ShoppingBagTableViewController.swift
//  nike-retail
//
//  Created by LeeChan on 4/17/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class ShoppingBagTableViewController: UITableViewController {
    
    var subtotal: Double = 0
    
    fileprivate struct TableCell {
        static let numberOfItemsCell = "numberOfItemsCell"      // cell 0
        static let itemCell = "itemCell"                        // cell 1
        static let cartDetailCell = "cartDetailCell"            // cell 2
        static let cartTotalCell = "cartTotalCell"              // cell 3
        static let checkoutButtonCell = "checkoutButtonCell"    // cell 4
    }
    
    var feeds: [Feed]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "SHOPPING BAG"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        feeds = fetchFeeds()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        tableView.register(NumberOfItemsCell.self, forCellReuseIdentifier: TableCell.numberOfItemsCell)
        tableView.register(ShoppingCartItemCell.self, forCellReuseIdentifier: TableCell.itemCell)
        tableView.register(CartDetailCell.self, forCellReuseIdentifier: TableCell.cartDetailCell)
        tableView.register(CartTotalCell.self, forCellReuseIdentifier: TableCell.cartTotalCell)
        tableView.register(ButtonToPressTVCell.self, forCellReuseIdentifier: TableCell.checkoutButtonCell)
        tableView.allowsSelection = false
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = feeds {
//            print(items.count)
            return items.count + 4
        } else {
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(indexPath.row)
        
        guard let items = feeds else { // first determine the number of items
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.itemTotal = 0
            return cell
        }
        
        if indexPath.row == 0 { // cell 0: number of itmes Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.numberOfItemsCell, for: indexPath) as! NumberOfItemsCell
            cell.itemTotal = items.count
            return cell
        } else if indexPath.row == items.count + 1 { // cell 1: Cart Detail Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.cartDetailCell, for: indexPath) as! CartDetailCell
            cell.subtotal = subtotal
            return cell
        } else if indexPath.row == items.count + 2 { // cell 2 : Cart Total Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.cartTotalCell, for: indexPath) as! CartTotalCell
            cell.total = subtotal * 1.1
            return cell
        } else if indexPath.row == items.count + 3 { // cell 3 : Checkout Button Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.checkoutButtonCell, for: indexPath) as! ButtonToPressTVCell
            cell.nvc = self.navigationController
            cell.title = "CHECKOUT"
            cell.tempNumber = subtotal
            subtotal = 0
            cell.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 241)
            return cell
        } else {                                     // cell 4 : item Cell
//            print(indexPath.item)
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.itemCell, for: indexPath) as! ShoppingCartItemCell
            cell.feed = self.feeds?[indexPath.item - 1]
            if let price = self.feeds?[indexPath.item - 1].price {
                    subtotal += price
            }
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let count = feeds?.count ?? 0
        
        switch indexPath.row {
        case 0:  // cell 0: number of itmes Cell
            return 25 + 2*24
        case count + 1:  // cell 1: Cart Detail Cell
            return 2*(24 + 2) + 3*(23)
        case count + 2:  // cell 2 : Cart Total Cell
            return 23 + 2*24
        case count + 3:  // cell 3 : Checkout Button Cell
            return 40.5 + 2*12
        default: // cell 4 : item Cell
            return 96 + 2*24
        }
        
//        if indexPath.row == 0 { // cell 0: number of itmes Cell
//            return 25 + 2*24
//        } else if indexPath.row == count + 1 { // cell 1: Cart Detail Cell
//            return 2*(24 + 2) + 3*(23)
//        } else if indexPath.row == count + 2 { // cell 2 : Cart Total Cell
//            return 23 + 2*24
//        } else if indexPath.row == count + 3 { // cell 3 : Checkout Button Cell
//            return 40.5 + 2*12
//        } else { // cell 4 : item Cell
//            return 96 + 2*24
//        }
        return UITableViewAutomaticDimension
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
