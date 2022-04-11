//
//  ApiConnection.swift
//  Ginnee App
//
//  Created by Jigar shethia on 07/01/22.
//

import Foundation

class ApiConnection: NSObject {
    
    public typealias Response = (_ data:Data? ,_ error:Error?) -> Void;
    public typealias ResponseData = (_ data:[QuestionMedata]? ,_ error:Error?) -> Void;
    
    public func registerUer(name:String, email:String, password:String)
    {
        
    }
    
    public func loginWithGoogle(Token token:String ,completionHandler:@escaping Response)
    {
        var parameters:[String:Any] = [:];
        parameters.updateValue(token, forKey: Constants.Params.token)
        
        let apiRequest = API(baseUrl: Constants.baseURL.value, path: Constants.loginWithGoogle.value, httpMethod: .post, parameters: parameters, authorization:"").buildRequest
        
        performRequest(with: apiRequest) { data, error in
            if let safeData=data
            {
                let decoder = JSONDecoder()
                do{
                    let decodedData = try  decoder.decode(LoginData.self, from: safeData)
                    let message = decodedData.message
//                    let error = decodedData.error
                    let results = decodedData.results
                    let code  = decodedData.code
                    print("message \(message)")
                    print("error \(error)")
                        print("results \(results.token)")
                    print("code \(code)")
//                    if(error == false)
//                    {
//                        self.authenticateUser(token:results.token) { data, error in
//
//                               completionHandler(data, error)
//                         }
                        completionHandler(data, error)
//                    }
                }
                catch
                {
                 print(error)
                }
            
            }
            completionHandler(data, error)
            
          }
        
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
        
        let apiRequest = API(baseUrl: Constants.baseURL.value, path: Constants.loginWithEmail.value, httpMethod: .post, parameters: parameters, authorization:"").buildRequest
        
        performRequest(with: apiRequest) { data, error in
            print("Data 2323 \(String(describing: data))")
            if let safeData=data
            {
                let decoder = JSONDecoder()
                do{
                    let decodedData = try  decoder.decode(LoginData.self, from: safeData)
                    let message = decodedData.message
                    let error = decodedData.error
                    let results = decodedData.results
                    let code  = decodedData.code
                    print("message \(message)")
                    print("error \(error)")
                        print("results \(results.token)")
                    print("code \(code)")
                    if(error == false)
                    {
                        self.authenticateUser(token:results.token) { data, error in
                                   
                               completionHandler(data, error)
                         }
                  
                    }
                }
                catch
                {
                 print(error)
                }
            
            }
            


        }
        
        
        
        
    }
    internal func authenticateUser(token:String, completionHandler:@escaping Response)
    {
        
        var parameters:[String:Any] = [:];
        parameters.updateValue(token, forKey: Constants.Params.email)
        let apiRequest = API(baseUrl: Constants.baseURL.value, path: Constants.authenticateUser.value, httpMethod: .get, parameters: nil, authorization:token).buildRequest
        
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
    func getQuestions(completionHandler:@escaping ResponseData)
    {
        let apiRequest = API(baseUrl: Constants.baseURL.value, path: Constants.questions.value, httpMethod: .get, parameters: nil, authorization:"").buildRequest
        
        performRequest(with: apiRequest) { data, error in
            print("Data 2323 \(String(describing: data))")
            if let safeData=data
            {
                let decoder = JSONDecoder()
                do{
                    let decodedData = try  decoder.decode(QuestionData.self, from: safeData)
                    let message = decodedData.message
                    let resultArray = decodedData.results
                    let errorData = decodedData.error
                    if(errorData == false)
                    {
                        completionHandler(resultArray, error)
                    }
                    
                    
                    
        
                }
                catch
                {
                 print(error)
                }
            
            }
            


        }
        
    }
    
    
    
    
    
    
    
}
