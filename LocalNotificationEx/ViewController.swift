//
//  ViewController.swift
//  LocalNotificationEx
//
//  Created by mayank ranka on 17/04/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var bellImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func showNotification(_ sender: Any) {
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [.alert , .sound]) { (allowed, error) in
            if allowed{
                print("Permission Granted")
            }else
            {
                print("Permission not granted")
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Winner Annoucmemnt"
        content.body = "Congratiulations to the winner of the round"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "1001", content: content, trigger: trigger)
        
        notiCenter.add(request){ (error) in
            print("Error\(error?.localizedDescription ?? "")")
        }
    }
}

