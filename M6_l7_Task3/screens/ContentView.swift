//
//  ContentView.swift
//  M6_l7_Task3
//
//  Created by Bekhruz Hakmirzaev on 03/12/22.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @ObservedObject var viewModel = EmployeeViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                List(self.viewModel.employees, id: \.id){ employee in
                    VStack(alignment: .leading){
                        HStack{
                            Image(employee.profile_image!).resizable()
                                .frame(width: 80, height: 80)
                            Text(employee.employee_name!).fontWeight(.bold)
                        }
                        HStack{
                            Text("Age: ")
                            Text(String(employee.employee_age!))
                        }
                        HStack{
                            Text("Salary: ")
                            Text(String(employee.employee_salary!))
                        }
                    }
                }
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
                .navigationBarTitle("Employee")
        }.onAppear{
            viewModel.apiEmployeeList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
