//
//  AlarmData.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/14.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import Combine
import SwiftUI

final class AlarmData: ObservableObject {
  let objectWillChange = PassthroughSubject<AlarmData, Never>()
  
  @UserDefaultAlarm(key: "Alarms", defaultValue: Alarm.defaultAlarm)
  var alarms: [Alarm] {
    didSet {
      objectWillChange.send(self)
    }
  }
}
