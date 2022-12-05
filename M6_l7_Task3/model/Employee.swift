//
//  Employee.swift
//  M6_l7_Task3
//
//  Created by Bekhruz Hakmirzaev on 03/12/22.
//

import Foundation

struct Employee: Decodable{
    var data : [Data]
}

struct Data: Decodable{
    let id:Int?
    let employee_name:String?
    let employee_salary:Int?
    let employee_age:Int?
    let profile_image:String?
    
//    enum CodingKeys:String,CodingKey{
//        case id
//        case employee_name = "employee_name"
//        case employee_salary = "employee_salary"
//        case employee_age = "employee_age"
//        case profile_image = "profile_image"
//    }
}
