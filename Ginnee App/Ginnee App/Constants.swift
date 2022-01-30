//
//  Constants.swift
//  Ginnee App
//
//  Created by Jigar on 19/01/22.
//

import Foundation

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
    
 
    
    var value:String
    {
        switch self {
        case .baseURL: return "http://3.6.142.35/v1/api/"
        case .registerUser: return "auth/register"
        case .loginWithEmail: return "auth/login"
        case .forgotPassword: return "password/forgot"
        case .resetPassword: return"password/reset"
        case .resendVerificationCode: return "verify/resend"
        }
   
        
    }
    
    public enum Params {
        static let email = "email";
        static let name = "name";
        static let password = "password";
        static let token = "token";
        
    }
 
}

