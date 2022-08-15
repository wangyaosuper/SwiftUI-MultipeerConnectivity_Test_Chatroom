//
//  JobView.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import SwiftUI

struct JobView: View{
    let job: JobModel;
    @EnvironmentObject var jobConnectionManager: JobConnectionManager
    
    var body: some View{
        List{
            Section(
                header: HStack(spacing: 8){
                    Text("Available Employees")
                    Spacer()
                    ProgressView()
                    
                }){
                    ForEach(jobConnectionManager.employees, id:\.self){
                        employee in
                        HStack {
                            Text(employee.displayName).font(.headline);
                            Spacer();
                        }.onTapGesture {
                            jobConnectionManager.invitePeer(employee, to:job);
                        }
                    }
                }
        }.onAppear{
            jobConnectionManager.startBrowsing();
        }.onDisappear{
            jobConnectionManager.stopBrowsing();
        }
    }
    
}
