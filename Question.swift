//
//  Question.swift
//  QuestionBank
//
//  Created by Sandeep Kumar on 04/02/15.
//  Copyright (c) 2015 Appirio. All rights reserved.
//

import Foundation

class Question {
    var questionId:String!
    var question:String!
    var opt1:String!
    var opt2:String!
    var opt3:String!
    var opt4:String!
    
    var opt1Selected:Bool
    var opt2Selected:Bool
    var opt3Selected:Bool
    var opt4Selected:Bool
    
    var correctAns:String!
    
    init() {
        opt1Selected = false
        opt2Selected = false
        opt3Selected = false
        opt4Selected = false
    }
    
    init(questionId:String,question:String,opt1:String,opt2:String,opt3:String,opt4:String,correctAns:String) {
        self.question = question
        self.questionId = questionId
        self.opt1 = opt1
        self.opt2 = opt2
        self.opt3 = opt3
        self.opt4 = opt4
        self.correctAns = correctAns
        opt1Selected = false
        opt2Selected = false
        opt3Selected = false
        opt4Selected = false
    }
}