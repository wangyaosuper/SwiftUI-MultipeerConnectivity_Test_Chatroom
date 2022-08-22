//
//  AddJobView.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import SwiftUI

struct AddJobView: View{
    @EnvironmentObject var jobListStore: JobListStore
    @Environment(\.presentationMode) var presentationMode;
    @Environment(\.dismiss) var dismiss;
    @State private var jobName = ""
    @State private var dueDate = Date()
    
    var body : some View{
        Form{
            TextField("Job Name", text: $jobName);
            DatePicker("Due Date", selection: $dueDate, in:Date()...,
                       displayedComponents: .date)
        
            HStack(alignment: .top){
                Button("Save"){
                    let job = JobModel(name: jobName, dueDate: dueDate,
                                       payout: "")
                    jobListStore.jobs.append(job)
                    //self.presentationMode.wrappedValue.dismiss();
                    dismiss()
                }.disabled(jobName.isEmpty)
                Button("Cancel"){
                    //self.presentationMode.wrappedValue.dismiss();
                    dismiss()
                }
            }
        }.listStyle(InsetGroupedListStyle())
            .navigationTitle("Add Job")
    }
}
