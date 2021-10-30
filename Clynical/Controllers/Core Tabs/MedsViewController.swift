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
    var models = [myReminder]()
    
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
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = myReminder(title: title, description: body, date: date, identifier: "id_\(title)")
                self.models.append(new)
                self.table.reloadData()
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = body
                content.sound = UNNotificationSound.default

                
                let targetDate = date

                let calendar = Calendar.current
                
                let targetDateComponets = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: targetDateComponets, repeats: false)
                let request = UNNotificationRequest(identifier: new.identifier, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapTest() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            
            guard settings.authorizationStatus == .authorized else {
                self.askPermission()
                return
            }
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Test Notification.",
                                              message: "Please exit the app and wait for 5 seconds to recieve test notification.",
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss",
                                              style: .cancel) { _ in
                    self.scheduleTest()
                })
                
                self.present(alert, animated: true)
            }
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

        
        let targetDate = Date().addingTimeInterval(5)

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
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        return cell
    }
    
}

struct myReminder {
    let title: String
    let description: String
    let date: Date
    let identifier: String
}

