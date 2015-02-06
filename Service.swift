//
//  Service.swift
//  QuestionBank
//
//  Created by Sandeep Kumar on 04/02/15.
//  Copyright (c) 2015 Appirio. All rights reserved.
//

import Foundation

class Service{
   
    
    func getPosts(callback:(NSArray)->()) {
        println("get posts")
        request("https://question-bank-sfdc.herokuapp.com/",callback)
    }
    
    func request(url:String,callback:(NSArray)->()) {
        var nsURL = NSURL(string: url)
        println(callback)
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL!) {
            (data,response,error) in
            var error:NSError?
            var response = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSArray
            callback(response)
        }
        task.resume()
    }
}