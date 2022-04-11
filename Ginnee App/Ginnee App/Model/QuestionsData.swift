//
//  QuestionsData.swift
//  Ginnee App
//
//  Created by Admin on 26/03/22.
//

import Foundation
struct QuestionData:Codable
{
    let message:String
    let error:Bool
    let results:[QuestionMedata]
}
struct QuestionMedata:Codable
{
    let status:Int
    let _id:String
    let title:String
    let lhs:String
    let rhs:String
    
}
