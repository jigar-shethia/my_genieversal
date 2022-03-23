//
//  appleDetails.swift
//  Ginnee App
//
//  Created by Admin on 14/03/22.
//

import Foundation

struct AppleDetails: Codable {
 var fullname: String
 var user: String
 var token: String

init(fullname: String, user: String, token: String){
    self.fullname = fullname
    self.user = user
    self.token = token
 }
}
