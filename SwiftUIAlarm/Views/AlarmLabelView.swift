//
//  AlarmLabelView.swift
//  SwiftUIAlarm
//
//  Created by Tae joong Yoon on 2019/06/20.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import SwiftUI

struct AlarmLabelView : View {
  @Binding var label: String
  
  var body: some View {
    VStack {
      TextField("Enter label", text: $label)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
    .navigationBarTitle(Text("Label"), displayMode: .inline)
  }
}
