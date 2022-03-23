//
//  Constants.swift
//  Ginnee App
//
//  Created by Jigar on 19/01/22.
//

import Foundation
import SwiftUI

internal enum UrlType {
    case baseURL
    case registerUser
    case loginWithEmail
    case forgotPassword
    case resetPassword
    case resendVerificationCode
}
internal enum Constants {
    case baseURL
    case registerUser
    case loginWithEmail
    case forgotPassword
    case resetPassword
    case resendVerificationCode
    case loginWithGoogle
    case authenticateUser
 
    
    var value:String
    {
        switch self {
        case .baseURL: return "http://3.6.142.35/v1/api/"
        case .registerUser: return "auth/register"
        case .loginWithEmail: return "auth/login"
        case .loginWithGoogle: return"/auth/google"
        case .forgotPassword: return "password/forgot"
        case .resetPassword: return"password/reset"
        case .resendVerificationCode: return "verify/resend"
        case .authenticateUser: return "auth"
        }
   
        
    }
    
    public enum Params {
        static let email = "email";
        static let name = "name";
        static let password = "password";
        static let token = "token";
        static let authorization = "Authorization";
        
    }
 
}

