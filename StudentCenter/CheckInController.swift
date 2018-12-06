//

//   CheckInController.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class CheckInController: UIViewController {
    @IBOutlet weak var currentTimeLb: UILabel!
    @IBOutlet weak var recordTimeLb: UILabel!
    
    @IBOutlet weak var checkInButton: UIButton!
    
    @IBOutlet weak var checkOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=NSLocalizedString("str_timeCheck", comment: "")
        checkInButton.setTitle(NSLocalizedString("str_checkIn", comment: ""), for: .normal)
        checkOutButton.setTitle(NSLocalizedString("str_checkOut", comment: ""), for: .normal)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = NSDate()
        let strCurrentTime = dateFormatter.string(from: date as Date) as String
        currentTimeLb.text = strCurrentTime;
        addCycleTimer()
    }
    
    fileprivate func addCycleTimer() {
        let timer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.handleTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode:RunLoopMode.commonModes)
    }
    
    @objc private func handleTimer (){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let currentDate = Date(timeIntervalSinceNow: 1)
        currentTimeLb.text = dateFormatter.string(from: currentDate)
    }
    
    func getStringFromTime(seconds:Int) -> String {
        let str_hour = NSString(format: "%02ld", seconds/3600)
        let str_minute = NSString(format: "%02ld", (seconds%3600)/60)
        let str_second = NSString(format: "%02ld", seconds%60)
        let string = NSLocalizedString("str_workingTime", comment: "")
        let format_time = NSString(format: string as NSString,str_hour,str_minute,str_second)
        return format_time as String
    }
    
    var firstDate = 0
    var secondDate = 0
    
    @IBAction func btnGetCurrTime(_ sender: UIButton) {
        
        recordTimeLb.text=currentTimeLb.text
        let dateString = currentTimeLb.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        firstDate = Int(dateFormatter.date(from: dateString!)!.timeIntervalSince1970)
    }
    
    @IBAction func btnCalcTime(_ sender: Any) {
        
        let dateString = currentTimeLb.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        secondDate = Int(dateFormatter.date(from: dateString!)!.timeIntervalSince1970)
        let timeDiff=secondDate-firstDate
        recordTimeLb.text = self.getStringFromTime(seconds: timeDiff)
    }
}

