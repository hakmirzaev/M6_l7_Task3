//
//  AFHTTp.swift
//  M6_l7_Task3
//
//  Created by Bekhruz Hakmirzaev on 03/12/22.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "http://dummy.restapiexample.com/"
private let DEV_SER = "http://dummy.restapiexample.com/"

let headers: HTTPHeaders = [
    "Accept" : "application/json"
]

class AFHTTp {
    //MARK: - AFHTTp Requests
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    class func post(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .post, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    class func put(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .put, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    class func del(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .delete, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    // MARK: - AFHTTp Methods
    class func server(url: String) -> URL {
        if IS_TESTER{
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    
    //MARK: - AFHTTp Apis
    static let API_EMPLOYEE_LIST = "api/v1/employees"
    static let API_EMPLOYEE_SINGLE = "api/v1/employee/" //id
    static let API_EMPLOYEE_CREATE = "api/v1/create"
    static let API_EMPLOYEE_UPDATE = "api/v1/update/" //id
    static let API_EMPLOYEE_DELETE = "api/v1/delete/" //id
    
    //MARK: - AFHTTP Params
    class func paramsEmpty() -> Parameters{
        let parameters: Parameters = [:]
        return parameters
    }
    
    class func paramsEmployeeCreate(data: Data) -> Parameters{
        let parameters: Parameters = [
            "employee_name" : data.employee_name!,
            "employee_salary" : data.employee_salary!,
            "employee_age" : data.employee_age!,
            "profile_image" : data.profile_image!
        ]
        return parameters
    }
    
    class func paramsEmployeeUpdate(data: Data) -> Parameters{
        let parameters: Parameters = [
            "id" : data.id!,
            "employee_name" : data.employee_name!,
            "employee_salary" : data.employee_salary!,
            "employee_age" : data.employee_age!,
            "profile_image" : data.profile_image!
        ]
        return parameters
    }
    
}

