//
//  ViewController.swift
//  Vibrate
//
//  Created by SuniMac on 2021/8/28.
//

import UIKit
class ViewController: UITableViewController {
    let data: [String] = ["error", "success", "warning", "light", "medium", "heavy", "soft", "rigid", "selection", "oldSchool", "v1519", "v1520", "v1521"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell()
        }
        
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        Vibration(rawValue: row)?.vibrate()
    }
}

import AVFoundation

enum Vibration: Int, CaseIterable {
    static var allCases: [Vibration] {
        return [.error, .success, .warning, .light, .medium, .heavy, .rigid, .soft, .selection, .oldSchool, .v1519, .v1520, .v1521]
    }
    
    case error = 0
    case success
    case warning
    case light
    case medium
    case heavy
    @available(iOS 13.0, *)
    case soft
    @available(iOS 13.0, *)
    case rigid
    case selection
    case oldSchool
    case v1519 // 轻震动
    case v1520 // 重震动
    case v1521 // 3连轻震动
    public func vibrate() {
        switch self {
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .soft:
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            }
        case .rigid:
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
            }
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .oldSchool:
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        case .v1519:
            AudioServicesPlaySystemSound(1519)
        case .v1520:
            AudioServicesPlaySystemSound(1520)
        case .v1521:
            AudioServicesPlaySystemSound(1521)
        }
    }
}
