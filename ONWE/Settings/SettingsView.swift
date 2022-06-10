//
//  settingsView.swift
//  ONWE
//
//  Created by Yanika Telus on 6/7/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @State var isNotifOn: Bool = false
    private var inspirational = "https://quotable.io/quotes?tags=inspirational"
    @State var results = ["there is hope even when your brain tells you there isn't","Healing is not linear", "I show my scars so that others may heal", "\"Once you choose hope, anything is possible.\" —Christopher Reeve","\"There are far, far better things ahead than anything we leave behind.\" —C.S. Lewis","“Give yourself another day, another chance. You will find your courage eventually. Don’t give up on yourself just yet.” "]
    @State var date: Date = Date()
    
    //show Time picker view
//    @State private var showView = false
    
    var body: some View {
        ZStack {
            Color(red: 0.33, green: 0.42, blue: 0.18)
            .ignoresSafeArea() // color runs past safe area
        VStack{
            Text("Settings")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
        VStack{
            Text("Push Notification")
                .bold()
                .foregroundColor(isNotifOn ? .green : .white)
            Toggle("Allow daily quote notifications?", isOn: $isNotifOn)
                .onChange(of: isNotifOn) { value in
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("The user allows notifications, Yay!")
                            isNotifOn = true
                        } else if let error = error {
                            print(error.localizedDescription)
                            isNotifOn = false
                        }
                    }
                }//end of onChange
                .foregroundColor(isNotifOn ? .green : Color(red: 0.89, green: 0.96, blue: 0.88))
            }//end of vstack
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
                    .foregroundColor(isNotifOn ? .green : .white)
            )
            .padding()
            
            if isNotifOn {
                VStack {
                    DatePicker("",selection: $date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                   .background(Color(red: 0.89, green: 0.96, blue: 0.88))
                   .padding()
                    
                    
                    let timeString = date.formatted(date: .omitted, time: Date.FormatStyle.TimeStyle.shortened)
                    
                    let timesArray = timeString.components(separatedBy: ":")
                    let hour = Int(timesArray[0]) ?? 1
                    
                    let minuteArray = timesArray[1].components(separatedBy: " ")
                    let minute = Int(minuteArray[0]) ?? 1
                    
                    Text("You will receive notifcation everyday at \(timeString)")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    
                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "How are you feeling?"
                    
                    content.subtitle = getRandomElement(results: results)
                    content.sound = UNNotificationSound.default

                    // show this notification based on user input using calendar
                    var dateComponent = DateComponents()
                    dateComponent.hour = hour
                    dateComponent.minute = minute
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)

                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 100)
                .padding(.vertical, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )}//End of Content VStack
//                Spacer()
            }//End of VStack
            Spacer()
        }//end of if isNotifOn
        }
        
    }//end of body view
}//end of settingsview

func getRandomElement(results: Array<String>) -> String {
    var returnString = ""
    if let resultString = results.randomElement() {
        returnString = resultString
    }
    
    return returnString
}


struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView()
    }
}
