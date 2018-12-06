//

//   RatingTableViewController.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit
class RatingTableViewController:UITableViewController{
    enum SectionType: Int {
        case ComputerScience, Mathematics, Physics
        static let allValues = [ComputerScience, Mathematics, Physics]
        
        func title() -> String {
            return String(describing: self).capitalized
        }
    }
    
    var myMajor : Major?
    override func viewDidLoad() {
        self.title=NSLocalizedString("str_rmp", comment: "")
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {

        let alertMsg = NSLocalizedString("str_deleteWarning", comment: "").replacingOccurrences(of: "_", with: title)
        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
                                      message: alertMsg,
                                      preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("str_delete", comment: ""),
                                         style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""),
                                         style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        /*
         **  In this case we need a source for the popover as well, but don't have a handy UIBarButtonItem.
         **  As alternative we therefore use the sourceView/sourceRect combination and specify a rectangel
         **  centered in the view of our viewController.
         */
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    func moveAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        
        let alertMsg = NSLocalizedString("str_moveWarning", comment: "").replacingOccurrences(of: "_", with: title)
        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
                                      message: alertMsg,
                                      preferredStyle: .actionSheet)
        
        let moveAction = UIAlertAction(title: NSLocalizedString("str_move", comment: ""),
                                       style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""),
                                         style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(moveAction)
        
        /*
         **  In this case we need a source for the popover as well, but don't have a handy UIBarButtonItem.
         **  As alternative we therefore use the sourceView/sourceRect combination and specify a rectangel
         **  centered in the view of our viewController.
         */
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allValues.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let tableSection = SectionType(rawValue: section) {
            
            switch tableSection {
            case .ComputerScience:
                return myMajor?.CSs.count ?? 0
            case .Mathematics:
                return myMajor?.Maths.count ?? 0
            case .Physics:
                return myMajor?.Physicss.count ?? 0
            }
        }
        
        return 0
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        return SectionType(rawValue: section)?.title()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTableCell") as? RatingTableCell else {
            fatalError("Expected RatingTableCell")
        }
        
        if let tableSection = SectionType(rawValue: indexPath.section) {
            
            switch(tableSection) {
            case .ComputerScience:
                if let cs = myMajor?.CSs[indexPath.row] {
                    cell.profName?.text = cs.prof
                    cell.rating?.text = cs.rate
                    cell.category.image = UIImage(named: "CS")
                }
            case .Mathematics:
                if let math = myMajor?.Maths[indexPath.row] {
                    cell.profName?.text = math.prof
                    cell.rating?.text = math.rate
                    cell.category.image = UIImage(named: "Math")
                }
            case .Physics:
                if let physics = myMajor?.Physicss[indexPath.row] {
                    cell.profName?.text = physics.prof
                    cell.rating?.text = physics.rate
                    cell.category.image = UIImage(named: "Physics")
                }
            }
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        }
        return proposedDestinationIndexPath
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if let tableSection = SectionType(rawValue: sourceIndexPath.section) {
            moveAlert(title: tableSection.title(), completion:{ _ in
            switch(tableSection) {
            case .ComputerScience:
                self.myMajor?.moveCS(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
                 self.tableView.reloadData()
            case .Mathematics:
                self.myMajor?.moveMath(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
                 self.tableView.reloadData()
            case .Physics:
                self.myMajor?.movePhysics(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
                 self.tableView.reloadData()
            }
            })
             self.tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return (tableView.isEditing) ? .delete : .none
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if let tableSection = SectionType(rawValue: indexPath.section) {
            
            if editingStyle == .delete {
                
                switch tableSection {
                case .ComputerScience:
                    if let cs = myMajor?.CSs[indexPath.row] {
                        deletionAlert(title: cs.prof, completion: { _ in
                            self.myMajor?.removeCS(cs)
                            self.tableView.reloadData()
                        })
                    }
                case .Mathematics:
                    if let math = myMajor?.Maths[indexPath.row] {
                        deletionAlert(title: math.prof, completion: { _ in
                            self.myMajor?.removeMath(math)
                            self.tableView.reloadData()
                        })
                    }
                case .Physics:
                    if let physics = myMajor?.Physicss[indexPath.row] {
                        deletionAlert(title: physics.prof, completion: { _ in
                            self.myMajor?.removePhysics(physics)
                            self.tableView.reloadData()
                        })
                    }
                }
            }
        }
    }
    // MARK: - Actions
    
    @IBAction func toggleEditingMode(_ sender: Any) {
        setEditing(!isEditing, animated: true)
    }
   
}
