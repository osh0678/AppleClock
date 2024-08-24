//
//  WorldClockViewController.swift
//  AppleClock
//
//  Created by seong on 8/15/24.
//

import UIKit

class WorldClockViewController: UIViewController {

    @IBOutlet weak var worldClockTableView: UITableView!
    
    var list = [
        TimeZone(identifier: "Asia/Seoul")!,
        TimeZone(identifier: "Europe/London")!,
        TimeZone(identifier: "Europe/Berlin")!,
        TimeZone(identifier: "Asia/Bangkok")!,
        TimeZone(identifier: "Asia/Tehran")!,
        TimeZone(identifier: "Asia/Vladivostok")!,
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .timeZoneDidSelect, object: nil, 
                                               queue: .main) { [weak self] noti in
            guard let self, let timeZone = noti.userInfo?["timeZone"] as? TimeZone else {
                return
            }
            
            guard !self.list.contains(where: { $0.identifier == timeZone.identifier }) else {
                return
            }
                    
            self.list.append(timeZone)
            self.worldClockTableView.reloadData()
        }
    }

}

extension WorldClockViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorldClockTableViewCell.self), for: indexPath) as! WorldClockTableViewCell
        
        let target = list[indexPath.row]
        cell.timeLabel.text = target.currentTime
        cell.timePeriodLabel.text = target.timePeriod
        cell.timeZoneLabel.text = target.city
        cell.timeOffsetLabel.text = target.timeOffset
        
        return cell
    }
    
}
