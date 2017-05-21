//
//  pictureTableViewController.swift
//  notebook
//
//  Created by Apple on 2017/5/18.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit
import os.log

class pictureTableViewController: UITableViewController {

    var files=[File]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight=80
        // Load any saved meals, otherwise load sample data.
        if let savedFiles = loadFiles() {
            files += savedFiles
        }
        else {
            // Load the sample dat
            loadSampleFiles()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.tableView.delegate=self
    }
    private func loadSampleFiles()
    {
        guard let file1=File(name: "风景", photo:#imageLiteral(resourceName: "fileicon")) else
        {
            fatalError("Uable to instantiate file")
        }
        guard let file2=File(name: "人物", photo:#imageLiteral(resourceName: "fileicon")) else
        {
            fatalError("Uable to instantiate file")
        }
       files+=[file1,file2]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    //实现向二级页的跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showpicture"
        {
            let collectionPage:pictureCollectionViewController=segue.destination as! pictureCollectionViewController
            collectionPage.navigationItem.title=files[self.tableView.indexPathForSelectedRow!.row].name
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndetifier="fileCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier:cellIndetifier,for: indexPath) as?fileCell else{
            fatalError("The dequeued cell is not an instance of fileCell")
        }
        let file=files[indexPath.row]
        cell.fileIcon.image=file.photo
        cell.fileName.text=file.name
        // Configure the cell...

        return cell
    }

    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        if (sender.state == UIGestureRecognizerState.began)
        {
            print("UIGestureRecognizerStateBegan");
        }
        if (sender.state == UIGestureRecognizerState.changed)
        {
            print("UIGestureRecognizerStateChanged");
        }
        if (sender.state == UIGestureRecognizerState.ended)
        {
            print("UIGestureRecognizerStateEnded");
            //在正常状态和编辑状态之间切换
            if(self.tableView!.isEditing == false)
            {
                self.tableView!.setEditing(true, animated:true)
            }
            else
            {
                self.tableView!.setEditing(false, animated:true)
                
            }
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           files.remove(at: indexPath.row)
            saveFiles()
            self.tableView.reloadData()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Mark:add a file
    @IBAction func addfile(_ sender: UIBarButtonItem) {
        var tmpFile=File(name: "请输入文件名", photo: #imageLiteral(resourceName: "fileicon"))
        files.append(tmpFile!)
        self.tableView.reloadData()
    }
    
    //Mark:Back to front page
    @IBAction func GoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        saveFiles()
    }
    
    //Mark:save files
    private func saveFiles(){
        let isSuccessfulSave=NSKeyedArchiver.archiveRootObject(files, toFile: File.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Files successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save files...", log: OSLog.default, type: .error)
        }
    }
    private func loadFiles()->[File]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: File.ArchiveURL.path) as? [File]
    }

}
