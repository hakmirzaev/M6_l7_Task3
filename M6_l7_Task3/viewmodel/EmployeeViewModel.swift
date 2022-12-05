//
//  EmployeeViewModel.swift
//  M6_l7_Task3
//
//  Created by Bekhruz Hakmirzaev on 03/12/22.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var employees = [Data]()
    
    func apiEmployeeList(){
        isLoading = true
        AFHTTp.get(url: AFHTTp.API_EMPLOYEE_LIST, params: AFHTTp.paramsEmpty(), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                self.employees = (try! JSONDecoder().decode(Employee.self, from: response.data!)).data
                print(self.employees)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiEmployeeSingle(id: Int){
        AFHTTp.get(url: AFHTTp.API_EMPLOYEE_SINGLE + String(id), params: AFHTTp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
}
