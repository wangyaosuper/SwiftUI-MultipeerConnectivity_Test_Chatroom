//
//  ButtonStyle.swift
//  Network_Test2
//
//  Created by York Wang on 2022/8/14.
//

import Foundation
import SwiftUI

struct MultipeerButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .font(.headline)
      .background(configuration.isPressed ? Color("rw-dark") : Color.accentColor)
      .cornerRadius(9.0)
      .foregroundColor(.white)
  }
}

struct ChatMessageButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label
      Spacer()
    }
    .padding(8)
    .background(configuration.isPressed ? Color("rw-dark") : Color.green)
    .cornerRadius(9.0)
    .foregroundColor(.white)
  }
}

struct FooterButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(configuration.isPressed ? Color("rw-dark") : .accentColor)
      .font(.headline)
      .padding(8)
  }
}

