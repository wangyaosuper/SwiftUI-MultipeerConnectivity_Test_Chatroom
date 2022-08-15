//
//  ContentView.swift
//  Shared
//
//  Created by York Wang on 2022/7/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView{
                JobListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem{
                Image(systemName: "briefcase")
                Text("Jobs")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
