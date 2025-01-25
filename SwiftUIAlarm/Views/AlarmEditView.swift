import SwiftUI

struct AlarmEditView: View {
    @EnvironmentObject var alarmData: AlarmData
    @Environment(\.presentationMode) var presentationMode

    @State private var date: Date
    @State private var repeatDay: [RepeatDay]
    @State private var label: String
    @State private var isSnoozed: Bool

    let alarm: Alarm

    init(alarm: Alarm) {
        self.alarm = alarm
        _date = State(initialValue: alarm.date)
        _repeatDay = State(initialValue: alarm.repeatDay.map { RepeatDay(rawValue: $0)! })
        _label = State(initialValue: alarm.label)
        _isSnoozed = State(initialValue: alarm.isSnooze)
    }

    var body: some View {
        VStack(spacing: 0) {
            DatePicker("Select Time", selection: $date, displayedComponents: .hourAndMinute)
            List {
                AlarmAddRepeatCellView(repeatDay: $repeatDay)
                AlarmAddLabelCellView(label: $label)
                AlarmAddSnoozeCellView(isSnoozed: $isSnoozed)
            }.listStyle(.grouped)
        }
        .navigationBarTitle(Text("Edit Alarm"), displayMode: .inline)
        .navigationBarItems(
            trailing: Button(action: saveAlarm) {
                Text("Save")
            }
        )
    }

    private func saveAlarm() {
        if let index = alarmData.alarms.firstIndex(where: { $0.id == alarm.id }) {
            alarmData.alarms[index].date = date
            alarmData.alarms[index].repeatDay = repeatDay.map { $0.rawValue }
            alarmData.alarms[index].label = label
            alarmData.alarms[index].isSnooze = isSnoozed
        }
        presentationMode.wrappedValue.dismiss()
    }
}