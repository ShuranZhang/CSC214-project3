//

//   AboutViewController.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit
class AboutViewController: UIViewController {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var buildLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var numberLaunchesLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var accessDateLabel : UILabel!
    
    let defaults = UserDefaults(suiteName: kAppGroupBundleID)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameLabel.text = Bundle.main.displayName
        appVersionLabel.text = Bundle.main.version
        buildLabel.text = Bundle.main.build
        copyrightLabel.text = Bundle.main.copyright
        print(Bundle.main.copyright!)
        numberLaunchesLabel.text = defaults.integer(forKey: dNumLaunches).description
        
        accessDateLabel.text = defaults.string(forKey: dAccessDate)
        doneBtn.setTitle(NSLocalizedString("str_done", comment: ""), for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func onDoneBtn(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
