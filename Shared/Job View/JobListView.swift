//
//  JobListView.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import Foundation
import SwiftUI

class JobListView : View{
    @ObservedObject var jobListStore: JobListStore;
    @ObservedObject var jobConnectManager: JobConnectionManager;
    @State private var showAddJob = false;
    
    init(jobListStore: JobListStore = JobListStore()){
        self.jobListStore = jobListStore;
        jobConnectManager = JobConnectionManager(){
            job in jobListStore.jobs.append(job);   ///  这行真的是没有看懂
        }
    }
    
    var body: some View{
        List{
            Section(header: headerView,
                    footer:footView){
                ForEach(jobListStore.jobs){
                    job in JobListRowView(job:job)
                        .environmentObject(jobConnectManager);
                }.onDelete(indexSet in jobListStore.jobs.remove(atOffsets: indexSet))
            }
        }
    }
    
    var headerView: some View{
        Toggle("Receive Job", isOn: $jobConnectManager.isReceivingJobs)
    }
    
    var footerView: some View{
        Button(action:{showAddJob = true}, label:{
            Label("Add Job", systemImage: "plus.circle")
        }).buttonStyle(style:FooterButtonStyle())
    }
    

}
