//
//  DetailNote.swift
//  notebook
//
//  Created by Apple on 2017/6/19.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class DetailNote: UIViewController {

    var notes=[Note]()
    var receivedstr:String=""
    var count:Int=0
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var noteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultnote1=Note(note: #imageLiteral(resourceName: "defaultNote"))
        let defaultnote2=Note(note:#imageLiteral(resourceName: "welcome"))
        notes.append(defaultnote1)
        notes.append(defaultnote2)
        noteImage.image=defaultnote2.note
        month.text=receivedstr
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changepicture(_ sender: UITapGestureRecognizer) {
        print("")
        count+=1
        if count<notes.count
        {
            noteImage.image=notes[count].note
        }
        else{
            count=0
            noteImage.image=notes[count].note
        }
    }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

