//
//  resultController.swift
//  QuestionBank
//
//  Created by Sandeep Kumar on 05/02/15.
//  Copyright (c) 2015 Appirio. All rights reserved.
//

import Foundation
import UiKit

class ResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var questionArray = [Question]()
    
    @IBOutlet weak var resultTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultTbl.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //resultTbl.set
        
        println(questionArray.count)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.resultTbl.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.questionArray[indexPath.row].question
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
