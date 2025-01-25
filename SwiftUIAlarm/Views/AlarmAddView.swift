//
//  AlarmAddView.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/19.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import SwiftUI

struct AlarmAddView : View {
  @EnvironmentObject var alarmData: AlarmData
  @Environment(\.presentationMode) var presentationMode
  
  @State var date: Date = Date()
  @State var repeatDay: [RepeatDay] = []
  @State var label: String = "Alarm"
  @State var isSnoozed: Bool = true
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        DatePicker("Select Time", selection: $date, displayedComponents: .hourAndMinute)
        List {
          AlarmAddRepeatCellView(repeatDay: $repeatDay)
          AlarmAddLabelCellView(label: $label)
          AlarmAddSnoozeCellView(isSnoozed: $isSnoozed)
        }.listStyle(.grouped)
      }
      .navigationBarTitle(Text("New Alarm"), displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: self.cancel) {
          Text("Cancel")
        },
        trailing: Button(action: self.createAlarm) {
          Text("Save")
        }
      )
    }
  }
  
  func cancel() {
    self.presentationMode.wrappedValue.dismiss()
  }
  
  func createAlarm() {
    // Add logic to create alarm
    self.presentationMode.wrappedValue.dismiss()
  }
}
