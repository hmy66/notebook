//
//  manageTableViewController.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class manageTableViewController: UITableViewController {

     var files=[File]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.rowHeight=80
        // Load any saved meals, otherwise load sample data.
        // Load the sample dat
        loadSampleFiles()
    }

    private func loadSampleFiles()
    {
        guard let file1=File(name: "2017/05", photo:#imageLiteral(resourceName: "fileicon")) else
        {
            fatalError("Uable to instantiate file")
        }
        guard let file2=File(name: "2017/06", photo:#imageLiteral(resourceName: "fileicon")) else
        {
            fatalError("Uable to instantiate file")
        }
        files+=[file1,file2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.tableView.delegate=self
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return files.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndetifier="file"
        guard let cell = tableView.dequeueReusableCell(withIdentifier:cellIndetifier,for: indexPath) as?fileTableViewCell else{
            fatalError("The dequeued cell is not an instance of fileCell")
        }
        let file=files[indexPath.row]
        cell.time.text=file.name
        // Configure the cell...
        
        return cell

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
    
    //实现向二级页的跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showimage"
        {
            let notePage: notesViewController = segue.destination as! notesViewController
        }
    }

}
