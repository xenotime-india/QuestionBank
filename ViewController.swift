//
//  ViewController.swift
//  QuestionBank
//
//  Created by Sandeep Kumar on 04/02/15.
//  Copyright (c) 2015 Appirio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var optLbl1: UILabel!
    @IBOutlet weak var optLbl2: UILabel!
    @IBOutlet weak var optLbl3: UILabel!
    @IBOutlet weak var optLbl4: UILabel!
    
    @IBOutlet weak var optBtn4: UIButton!
    @IBOutlet weak var optBtn3: UIButton!
    @IBOutlet weak var optBtn2: UIButton!
    @IBOutlet weak var optBtn1: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var loadingBg: UIImageView!
    
    @IBOutlet weak var loadingMessage: UILabel!
    @IBOutlet weak var loadingImg: UIActivityIndicatorView!
    var questionArrar = [Question]()
    var service:Service!
    var currentQuestion = 0;
    
    @IBAction func opt1Btn(sender: UIButton) {
        if(questionArrar[currentQuestion].opt1Selected) {
            sender.setImage(UIImage(named: "opt1"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt1Selected = false
        }
        else {
            sender.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt1Selected = true
        }
    }
    
    @IBAction func opt2Btn(sender: UIButton) {
        if(questionArrar[currentQuestion].opt2Selected) {
            sender.setImage(UIImage(named: "opt2"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt2Selected = false
        }
        else {
            sender.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt2Selected = true
        }
    }
    @IBAction func opt3Btn(sender: UIButton) {
        if(questionArrar[currentQuestion].opt3Selected) {
            sender.setImage(UIImage(named: "opt3"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt3Selected = false
        }
        else {
            sender.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt3Selected = true
        }
    }
    
    @IBAction func opt4Btn(sender: UIButton) {
        if(questionArrar[currentQuestion].opt4Selected) {
            sender.setImage(UIImage(named: "opt4"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt4Selected = false
        }
        else {
            sender.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            questionArrar[currentQuestion].opt4Selected = true
        }
    }
    @IBAction func nextBtnClick(sender: UIButton) {
        if(currentQuestion < questionArrar.count - 1 ) {
            currentQuestion++;
            self.questionLbl.text = self.questionArrar[self.currentQuestion].question
            self.optLbl1.text = self.questionArrar[self.currentQuestion].opt1
            self.optLbl2.text = self.questionArrar[self.currentQuestion].opt2
            self.optLbl3.text = self.questionArrar[self.currentQuestion].opt3
            self.optLbl4.text = self.questionArrar[self.currentQuestion].opt4
            optBtn1.setImage(UIImage(named: "opt1"), forState: UIControlState.Normal)
            optBtn2.setImage(UIImage(named: "opt2"), forState: UIControlState.Normal)
            optBtn3.setImage(UIImage(named: "opt3"), forState: UIControlState.Normal)
            optBtn4.setImage(UIImage(named: "opt4"), forState: UIControlState.Normal)
            
            if(questionArrar[currentQuestion].opt1Selected) {
                optBtn1.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            
            if(questionArrar[currentQuestion].opt2Selected) {
                optBtn2.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            
            if(questionArrar[currentQuestion].opt3Selected) {
                optBtn3.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            
            if(questionArrar[currentQuestion].opt4Selected) {
                optBtn4.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            self.prevBtn.hidden = false
            if(currentQuestion == questionArrar.count - 1) {
                self.nextBtn.hidden = true
            }
        }
        
    }
    @IBAction func prevBtnClick(sender: AnyObject) {
        if(currentQuestion > 0) {
            currentQuestion--;
            self.questionLbl.text = self.questionArrar[self.currentQuestion].question
            self.optLbl1.text = self.questionArrar[self.currentQuestion].opt1
            self.optLbl2.text = self.questionArrar[self.currentQuestion].opt2
            self.optLbl3.text = self.questionArrar[self.currentQuestion].opt3
            self.optLbl4.text = self.questionArrar[self.currentQuestion].opt4
            
            optBtn1.setImage(UIImage(named: "opt1"), forState: UIControlState.Normal)
            optBtn2.setImage(UIImage(named: "opt2"), forState: UIControlState.Normal)
            optBtn3.setImage(UIImage(named: "opt3"), forState: UIControlState.Normal)
            optBtn4.setImage(UIImage(named: "opt4"), forState: UIControlState.Normal)
            
            if(questionArrar[currentQuestion].opt1Selected) {
                optBtn1.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            
            if(questionArrar[currentQuestion].opt2Selected) {
                optBtn2.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            
            if(questionArrar[currentQuestion].opt3Selected) {
                optBtn3.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            
            if(questionArrar[currentQuestion].opt4Selected) {
                optBtn4.setImage(UIImage(named: "selected"), forState: UIControlState.Normal)
            }
            self.nextBtn.hidden = false
            if(currentQuestion == 0) {
                self.prevBtn.hidden = true
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        service = Service()
        
        service.getPosts{
            (response) in
            
            for post in response as NSArray {
                //println(post);
                var id:String = post["questionid"]! as String
                println(id);
                var question:String = post["question"]! as String
                println(question);
                var opt1:String = post["opt1"]! as String
                println(opt1);
                var opt2:String = post["opt2"]! as String
                println(opt2);
                var opt3:String = post["opt3"]! as String
                var opt4:String = post["opt4"]! as String
                println(opt4);
                var correctAns:String = post["correctans"]! as String!
                println(id);
                var postObj = Question(questionId: id, question: question, opt1: opt1, opt2: opt2, opt3: opt3, opt4: opt4, correctAns: correctAns)
                self.questionArrar.append(postObj)
                
            }
            println(self.questionArrar);
            
            dispatch_async(dispatch_get_main_queue()) {
                self.questionLbl.text = self.questionArrar[self.currentQuestion].question
                self.optLbl1.text = self.questionArrar[self.currentQuestion].opt1
                self.optLbl2.text = self.questionArrar[self.currentQuestion].opt2
                self.optLbl3.text = self.questionArrar[self.currentQuestion].opt3
                self.optLbl4.text = self.questionArrar[self.currentQuestion].opt4
                self.loadingMessage.hidden = true
                self.loadingBg.hidden = true
                self.loadingImg.hidden = true
                self.prevBtn.hidden = true
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var resultCont:ResultController = segue.destinationViewController as ResultController
        
        resultCont.questionArray = self.questionArrar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

