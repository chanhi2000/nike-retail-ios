//
//  CheckoutTableViewController.swift
//  nike-retail
//
//  Created by LeeChan on 5/3/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class CheckoutTableViewController: UITableViewController {
    var subtotal: Double = 0.0
    
    fileprivate struct TableCell {
        static let billingTitleCell = "billingTitleCell"    // cell 0
        static let billingInfoCell = "billingInfoCell"      // cell 1
        static let cartDetailCell = "cartDetailCell"        // cell 2
        static let cartTotalCell = "cartTotalCell"          // cell 3
        static let submitButtonCell = "submitButtonCell"    // cell 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "CHECKOUT"
        navigationController?.navigationBar.topItem?.title = "" // UI: removes back button's text
        
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        tableView.register(BillingTitleCell.self, forCellReuseIdentifier: TableCell.billingTitleCell)
        tableView.register(BillingInfoCell.self, forCellReuseIdentifier: TableCell.billingInfoCell)
        tableView.register(CartDetailCell.self, forCellReuseIdentifier: TableCell.cartDetailCell)
        tableView.register(CartTotalCell.self, forCellReuseIdentifier: TableCell.cartTotalCell)
        tableView.register(ButtonToPressTVCell.self, forCellReuseIdentifier: TableCell.submitButtonCell)
        tableView.allowsSelection = false
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.billingTitleCell, for: indexPath) as! BillingTitleCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.billingInfoCell, for: indexPath) as! BillingInfoCell
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.cartDetailCell, for: indexPath) as! CartDetailCell
            cell.subtotal = subtotal
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.cartTotalCell, for: indexPath) as! CartTotalCell
            cell.total = subtotal * 1.1
            subtotal = 0
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.submitButtonCell, for: indexPath) as! ButtonToPressTVCell
            cell.title = "SUBMIT ORDER"
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:  // cell 0: Billing Title Cell
            return 21.5 + 2*24
        case 1:  // cell 1: Billing Info Cell
            return 4*(44+19.5+8) + 5*24
        case 2:  // cell 2: Cart Detail Cell
            return 2*(24 + 2) + 3*(23)
        case 3:  // cell 3 : Cart Total Cell
            return 23 + 2*24
        case 4: // cell 4 : Submit Order Button Cell
            return 40.5 + 2*12
        default:
            return UITableViewAutomaticDimension
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
