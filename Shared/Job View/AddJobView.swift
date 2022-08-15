//
//  AddJobView.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import SwiftUI

struct AddJobView: View{
    @EnvironmentObject var jobListStore: JobListStore
    @State private var jobName = ""
    @State private var dueDate = Date()
    var body : some View{
        Form{
            TextField("Job Name", text: $jobName);
            DatePicker("Due Date", selection: $dueDate, in:Date()...,
                       displayedComponents: .date)
        
            Button("Save"){
                let job = JobModel(name: jobName, dueDate: dueDate,
                                   payout: "")
                jobListStore.jobs.append(job)
            }.disabled(jobName.isEmpty)
        }.listStyle(InsetGroupedListStyle())
            .navigationTitle("Add Job")
    }
}
