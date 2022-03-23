//
//  EndPointType.swift
//  Ginnee App
//
//  Created by Jigar on 19/01/22.
//

import Foundation
public enum HTTPMethod : String {
   
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
    case patch   = "PATCH"
}

internal typealias Parameters = [String:Any];
internal protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters, Authorization authorization:String) throws
}

internal protocol EndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
}



internal struct API:EndPointType {
    
    public var baseURL: String
    public var parameters: Parameters?
    public var path: String
    public var httpMethod: HTTPMethod
    public var authorization:String
    
    
    init(baseUrl:String ,path:String , httpMethod:HTTPMethod ,parameters: Parameters?, authorization:String)
     {
        
        self.baseURL = baseUrl
        self.path = path
        self.httpMethod = httpMethod
        self.parameters = parameters
        self.authorization = authorization
        
     }
        
    var buildRequest:URLRequest {
        
        var url = self.baseURL+self.path
        var request : URLRequest?
        
        
        if(parameters == nil && self.httpMethod.rawValue == "GET"){
            
            var items = [URLQueryItem]()
           
           
            
            let urlComponents = NSURLComponents(string: url)
            if !items.isEmpty {
                urlComponents!.queryItems = items
            }
            
            request = URLRequest(url: urlComponents!.url!,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 60.0)
            request?.httpMethod = self.httpMethod.rawValue
            
        }
        else {

            request = URLRequest(url: URL(string: url)!,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 60.0)
            request?.httpMethod = self.httpMethod.rawValue
            if let param = self.parameters {
                
                do
                {
                    try JSONParameterEncoder.encode(urlRequest: &request!, with: param, Authorization:authorization);
                    
                } catch  {
                    print(error);
                }
            }
         }
        
        return request!
        
    }
    
}
    
internal struct JSONParameterEncoder:ParameterEncoder {
    
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters,Authorization authorization:String) throws {
     
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: []);
            urlRequest.httpBody = jsonAsData;
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.setValue("application/json", forHTTPHeaderField: "Accept");
                if authorization != ""
                {
                    urlRequest.setValue("Bearer \(authorization)", forHTTPHeaderField: "Authorization");
                }
               
            }
        } catch  {
            throw error;
        }
    }
}
