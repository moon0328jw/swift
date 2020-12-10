//
//  ViewController.swift
//  project1
//
//  Created by 문주원 on 2020/06/08.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {

    var ref: DatabaseReference!
    let uid: String = (Auth.auth().currentUser?.uid)!
    var finishDate: [String] = []
    
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        recallItemsData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tvListView.reloadData()
    }
    
    func recallItemsData() {
        ref.child(uid).observeSingleEvent(of: .value, with: { snapshot in
            if let titleName = snapshot.value as? [String: Any] {
                for (title, _) in titleName {
                    items.append(title)
                    print(items)
                    self.recallfinishDate(title)
                }
            }
        })
        return
    }
    
    func recallfinishDate(_ title: String) {
        ref.child(uid).child(title).child("finish").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? "errorFinishDate"
            self.finishDate.append(value)
            print(self.finishDate)
            self.makeDday()
            return
        }
    }
    
    func makeDday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd."
        let date = Date()
        let nowDateStr = formatter.string(from: date)
        var dates: String = ""
        dDayCount += 1
        
        // 만료 년
        var firstIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 0)
        var lastIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 4)
        var year = String(finishDate[dDayCount][firstIndex..<lastIndex])

        // 현재 년
        firstIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 0)
        lastIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 4)
        var currentYear = String(nowDateStr[firstIndex..<lastIndex])

        // 만료 월
        firstIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 6)
        lastIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 8)
        var month = String(finishDate[dDayCount][firstIndex..<lastIndex])
            

        // 현재 월
        firstIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 6)
        lastIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 8)
        var currentMonth = String(nowDateStr[firstIndex..<lastIndex])

        // 만료 일
        firstIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 10)
        lastIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 12)
        var day = String(finishDate[dDayCount][firstIndex..<lastIndex])

        // 현재 일
        firstIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 10)
        lastIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 12)
        let currentDay = String(nowDateStr[firstIndex..<lastIndex])
            
        dates = String(totalDay(y: Int(year)!, m: Int(month)!, d: Int(day)!) - totalDay(y: Int(currentYear)!, m: Int(currentMonth)!, d: Int(currentDay)!))
        datesArray.append(dates)
        dDay.append(datesArray[dDayCount])
        print(dDay)
        return
    }
    
    func totalDay(y: Int, m: Int, d: Int) -> Int {
        var monthArray: [Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
        var total: Int = 0
        
        total = ((y - 1)*365) + ((y - 1)/4) - ((y - 1)/100) + ((y - 1)/400)
        
        
        if(((y % 4 == 0) && (y % 100 == 0)) || (y % 400 == 0)){
            monthArray[1] = monthArray[1] + 1
        }
        for i in stride(from: 0, to: m - 1, by: 1) {
            total += monthArray[i]
        }
        total += d
        
        return total
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.detailTextLabel?.text = "D - " + dDay[(indexPath as NSIndexPath).row]
        // Configure the cell..
        return cell
        // Configure the cell...

    }
    
    /*xx    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let currentCell: String = items[(indexPath as NSIndexPath).row]
            
            items.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            ref = Database.database().reference()
            let removeRef = ref.child(uid).child(currentCell)
            removeRef.removeValue()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

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

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveTitleText(items[((indexPath as NSIndexPath?)?.row)!])
        }
    }
}
