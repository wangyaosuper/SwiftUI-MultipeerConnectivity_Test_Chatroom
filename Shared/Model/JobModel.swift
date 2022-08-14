//
//  JobModel.swift
//  Network_Test2
//
//  Created by York Wang on 2022/7/24.
//

import Foundation


class JobListStore: ObservableObject {
    @Published var jobs: [JobModel] = [];
}

struct JobModel: Codable, Identifiable {
  var id = UUID()
  let name: String
  let dueDate: Date
  let payout: String
    
    
  init(name: String, dueDate: Date, payout: String) {
      self.name = name
      self.dueDate = dueDate
      self.payout = "Billion"
  }

  func data() -> Data? {
    let encoder = JSONEncoder()
    return try? encoder.encode(self)
  }
}
