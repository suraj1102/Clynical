//
//  MedsViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 01/10/2021.
//

import UserNotifications
import UIKit

class MedsViewController: UIViewController {
    
    @IBOutlet var table: UITableView!
    var Models = [myReminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func didTapAdd() {
        // Show AddMedViewController
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addMedView") as? AddMedViewController else { return }
        vc.title = "Add Med Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { title, body, date in
            
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapTest() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            
            guard settings.authorizationStatus == .authorized else {
                self.askPermission()
                return
            }
            
            // fire test notification
            self.scheduleTest()
            
        }
    }
    
    private func askPermission() {
        // ask permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
            if success {
                self.didTapTest()
            }
            else {
                return
            } 
        })
    }
    
    private func scheduleTest() {
        let content = UNMutableNotificationContent()
        content.title = "Test Notification"
        content.body = "This is a test for the notifications in this app. If you are seeing this it means all good."
        content.sound = UNNotificationSound.default

        
        let targetDate = Date().addingTimeInterval(7)

        var calendar = Calendar.current
        calendar.timeZone = .current
        
        let targetDateComponets = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: targetDateComponets, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
}
    


extension MedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension MedsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Models[indexPath.row].title
        return cell
    }
    
}

struct myReminder {
    let title: String
    let date: Date
    let description: String
}

