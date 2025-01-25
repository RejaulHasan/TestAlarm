//
//  AlarmListView.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/14.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import SwiftUI

struct AlarmListView: View {
    @EnvironmentObject var alarmData: AlarmData

    var body: some View {
        NavigationView {
            List {
                ForEach(self.alarmData.alarms) { alarm in
                    NavigationLink(destination: AlarmEditView(alarm: alarm).environmentObject(self.alarmData)) {
                        AlarmView(alarm: alarm)
                    }
                }
                .onDelete(perform: deleteAlarm)
            }
            .navigationBarTitle(Text("Alarm"))
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink(
                    destination: AlarmAddView().environmentObject(self.alarmData)
                ) {
                    Image(systemName: "plus")
                }
            )
        }
    }

    private func deleteAlarm(at offsets: IndexSet) {
        alarmData.alarms.remove(atOffsets: offsets)
    }
}
