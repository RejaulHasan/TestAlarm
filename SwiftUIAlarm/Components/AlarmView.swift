//
//  AlarmView.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/14.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import SwiftUI

extension DateFormatter {
    static let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter
    }()
    
    static let meridiemFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter
    }()
}

struct AlarmView: View {
    @EnvironmentObject var alarmData: AlarmData
    let alarm: Alarm
    
    var alarmIndex: Int? {
        alarmData.alarms.firstIndex(where: { $0.id == alarm.id })
    }
    
    var body: some View {
        if let alarmIndex = alarmIndex {
            Toggle(isOn: $alarmData.alarms[alarmIndex].isActive) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(alarm.date, formatter: DateFormatter.timeFormat)")
                        .font(.system(size: 40))
                    +
                    Text("\(alarm.date, formatter: DateFormatter.meridiemFormat)")
                        .font(.system(size: 20))
                    HStack(spacing: 0) {
                        Text(alarm.label)
                            .font(.subheadline)
                        
                        if !alarm.repeats.isEmpty {
                            Text(", \(alarm.repeats)")
                                .font(.subheadline)
                        }
                    }
                }
            }
        } else {
            Text("Alarm not found")
        }
    }
}
