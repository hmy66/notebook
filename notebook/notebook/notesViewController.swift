//
//  notesViewController.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class notesViewController: UIViewController {

    @IBOutlet weak var noteimage: UIImageView!
    var count:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        notes.append(#imageLiteral(resourceName: "welcome"))
        notes.append(#imageLiteral(resourceName: "portrait"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func changepicture(_ sender: UITapGestureRecognizer) {
        print("")
        count+=1
        if count<notes.count
        {
            noteimage.image=notes[count]
        }
        else{
            count=0
            noteimage.image=notes[count]
        }
    }
}
