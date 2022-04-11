//
//  LoginData.swift
//  Ginnee App
//
//  Created by Admin on 24/02/22.
//

import Foundation
struct LoginData:Codable {
    
    let message:String
    let error:Bool
    let code:Int
    let results:Results
    
}
struct Results:Codable {

    let token:String

}

