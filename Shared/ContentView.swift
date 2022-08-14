//
//  ContentView.swift
//  Shared
//
//  Created by York Wang on 2022/7/10.
//

import SwiftUI

struct ContentView: View {
    @State var startAnimation = false;
    func triggerAnimation(){
        self.startAnimation.toggle();
    }
    var body: some View {
        VStack{
            /* Text("Hello, world!").animation(.linear(duration: 1),value:startAnimation).opacity(startAnimation).padding(); */
            Text("Hello, world!").animation(.linear(duration: 2),value:startAnimation).offset(x:startAnimation ? 200:0, y:100).animation(.spring(), value:startAnimation).padding();
            HStack{
                Button(action:triggerAnimation){
                    Text("OK");
                };
                Button(action:{}){
                    Text("Cancel");
                }
            }
        }.frame(width:400, height:400);
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
