//
//  ApiConnection.swift
//  Ginnee App
//
//  Created by Jigar shethia on 07/01/22.
//

import Foundation

class ApiConnection: NSObject {
    
    public typealias Response = (_ data:Data? ,_ error:Error?) -> Void;
    
    public func registerUer(name:String, email:String, password:String)
    {
        
    }
    public func loginWithEmail(Email email:String ,Password password:String,  completionHandler:@escaping Response)
    {
        print("loginWithEmail 11")
        var parameters:[String:Any] = [:];
        parameters.updateValue(email, forKey: Constants.Params.email)
        parameters.updateValue(password, forKey: Constants.Params.password)
        
        print("baseUrl \( Constants.baseURL.value)")
        print("path \( Constants.loginWithEmail.value)")
        print("parameters \(parameters)")
        
        let apiRequest = API(baseUrl: Constants.baseURL.value, path: Constants.loginWithEmail.value, httpMethod: .post, parameters: parameters).buildRequest
        
        performRequest(with: apiRequest) { data, error in
            
            completionHandler(data, error)
        }
        
        
        
        
    }
    func forgotPassword(email:String)
    {
        
    }
    func resetPassword(token:String, password:String)
    {
        
    }
    func resendVerificationCode(email:String)
    {
        
    }
    
    func performRequest(with URL:URLRequest, completionHandler:@escaping Response) {
        
        print("performRequest 2222")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL, completionHandler:{(data:Data?, respone:URLResponse?,error:Error?) in
            
            if error != nil
            {
                completionHandler(nil,error);
                print(" performRequest error \(error!)")
                return
            }else
            
            {
                
                if let safeData=data
                {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print("performRequest dataString \(dataString!)")
                    completionHandler(safeData,error)
                    
                }
            }
        })
        task.resume()
        
    }
    
    
    
    
    
    
}
