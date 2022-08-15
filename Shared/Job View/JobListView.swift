//
//  JobListView.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import Foundation
import SwiftUI

struct JobListView : View{
    @ObservedObject var jobListStore: JobListStore;
    @ObservedObject var jobConnectionManager: JobConnectionManager;
    @State private var showAddJob = false;
    
    init(jobListStore: JobListStore = JobListStore()){
        print("CheckPoint 0")
        self.jobListStore = jobListStore;
        self.jobConnectionManager = JobConnectionManager(){
            job in jobListStore.jobs.append(job);   ///  这行真的是没有看懂
        }
    }
    
    var body: some View{
        List{
            Section(header: headerView,
                    footer:footerView){
                ForEach(jobListStore.jobs){
                    job in JobListRowView(job:job)
                        .environmentObject(self.jobConnectionManager);
                }.onDelete{indexSet in self.jobListStore.jobs.remove(atOffsets: indexSet)}
            }
        }.listStyle(InsetGroupedListStyle())
            .navigationTitle("Job")
            .sheet(isPresented:$showAddJob){
                NavigationView{
                    AddJobView().environmentObject(jobListStore)
                }
            }
    }
    
    var headerView: some View{
        Toggle("Receive Job", isOn: $jobConnectionManager.isReceivingJobs)
    }
    
    var footerView: some View{
        Button(action:{showAddJob = true}, label:{
            Label("Add Job", systemImage: "plus.circle")
        }).buttonStyle(FooterButtonStyle())
    }
    

}
