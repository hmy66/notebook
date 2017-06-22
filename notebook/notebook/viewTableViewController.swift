//
//  viewTableViewController.swift
//  notebook
//
//  Created by Apple on 2017/6/19.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit
import os.log

class viewTableViewController: UITableViewController,UINavigationControllerDelegate{

    //1到12月的手账
    var jan=[Note]()
    var feb=[Note]()
    var mar=[Note]()
    var apri=[Note]()
    var may=[Note]()
    var june=[Note]()
    var july=[Note]()
    var aug=[Note]()
    var sep=[Note]()
    var oct=[Note]()
    var nov=[Note]()
    var dec=[Note]()
    var tmpNote:Note?
    var teststr:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight=80
        print(teststr)
        //june.append(tmpNote!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.tableView.delegate=self
        // Dispose of any resources that can be recreated.
    }

    func putnav()
    {
        let nav=UINavigationController(rootViewController: self)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 12
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="NoteDetail"
        {
            if let secondView=segue.destination as? DetailNote{
                let month=self.tableView.indexPathForSelectedRow!.row
                let tmp="\(month+1)月"
                if(month==5)
                {
                    secondView.notes.append(tmpNote!)
                }
                secondView.receivedstr=tmp
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellidentifier", for: indexPath) as? noteTableViewCell else{
            fatalError("The dequeued cell is not an instance of fileCell")
        }
        print("in func table view")
        var month=indexPath.row
        month=month+1
        cell.fileIcon.image=#imageLiteral(resourceName: "fileicon")
        cell.time.text="\(month)月"
        // Configure the cell...

        return cell
    }
    
    @IBAction func goback(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
    //Mark:Note的归档和解档
    /*private func savenotes()
    {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(lists, toFile: user.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("notes successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save notes...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadUsers()->[user]?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Note.ArchiveURL.path) as? [user]
    }*/
    

}
