//
//  JobListRowView.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import SwiftUI


struct JobListRowView : View {
    @EnvironmentObject var jobConnectionManager: JobConnectionManager
    let job: JobModel
    
    
    
    var body: some View{
        NavigationLink(
            destination: JobView(job:job).environmentObject(jobConnectionManager)){
                HStack{
                    VStack(alignment: .leading){
                        Text(job.name).font(.title3)
                    }
                }
            }
    }
}
