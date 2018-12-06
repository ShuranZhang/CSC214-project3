//

//   MainMenuController.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit
class MainMenuController:UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    @IBOutlet weak var checkin: UIImageView!
    @IBOutlet weak var weather: UIImageView!
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var rating: UIImageView!
    
    @IBOutlet weak var map: UIImageView!
    
    @IBOutlet weak var blackBoard :UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var majorLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var majorTextField: UITextField!
   
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var updateProfileButton: UIButton!
    
    @IBOutlet weak var nameLabel2: UILabel!
    
    @IBOutlet weak var majorLabel2: UILabel!
    
    @IBOutlet weak var yearLabel2: UILabel!
    
    
    var myMajor = Major()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("str_mainMenu", comment: "")
        profileLabel.text=NSLocalizedString("str_profile", comment: ""); weather.isUserInteractionEnabled = true
        nameLabel2.text=NSLocalizedString("str_name", comment: "")
        majorLabel2.text=NSLocalizedString("str_major", comment: "")
        yearLabel2.text=NSLocalizedString("str_year", comment: "")
        updateProfileButton.setTitle(NSLocalizedString("str_updateProfile", comment: ""), for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.showWeather))
        weather.addGestureRecognizer(tap)
        
        checkin.isUserInteractionEnabled = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.showCheckin))
        checkin.addGestureRecognizer(tap2)
        
        rating.isUserInteractionEnabled = true
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.showRating))
        rating.addGestureRecognizer(tap3)
        
        map.isUserInteractionEnabled = true
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.showMap))
        map.addGestureRecognizer(tap4)
        
        blackBoard.isUserInteractionEnabled = true
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(self.showBB))
        blackBoard.addGestureRecognizer(tap5)
        
        
        configureView()
        
        
       
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showCamera" {
//            
//                let controller = segue.destination as! CameraViewController
//                
//                controller.detailItem = photoItem
//            
//        }
//    }

    @IBAction func showWeather(_ sender: Any){
        self.performSegue(withIdentifier: "WeatherSegue", sender: self)
    }
    @IBAction func showCheckin(_ sender: Any){
        self.performSegue(withIdentifier: "showCheckIn", sender: self)
    }
    @IBAction func showRating(_ sender: Any){
        self.performSegue(withIdentifier: "showRating", sender: self)
    }
    @IBAction func showMap(_ sender: Any){
        self.performSegue(withIdentifier: "showMap", sender: self)
    }
    @IBAction func showBB(_ sender: Any){
        self.performSegue(withIdentifier: "showBB", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRating"{
            let controller = (segue.destination as! RatingTableViewController)
            controller.myMajor = myMajor
        }
    }
    func configureView() {
        
        if let detail = detailItem {
            photo?.image = detail.photo
        }
    }
    
    var detailItem: PhotoItem? //{
//        didSet {
//            // Update the view.
//            configureView()
//        }
//    }
//
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photo.image = picture
            detailItem?.photo = picture
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onCameraBtn(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    @IBAction func changeName(_ sender: Any) {
        nameLabel.text=nameTextField.text
    }
    @IBAction func changeYear(_ sender: Any) {
        yearLabel.text=yearTextField.text
        yearTextField.isHidden=true
    }
    @IBAction func changeMajor(_ sender: Any) {
        majorLabel.text=majorTextField.text
        majorTextField.isHidden=true
    }
    
    @IBAction func editeName(_ sender: Any) {
        nameLabel.text=nameTextField.text
        nameTextField.isHidden=true
    }
    
    @IBAction func editYear(_ sender: Any) {
        yearLabel.text=yearTextField.text
        yearTextField.isHidden=true
    }
  
    @IBAction func editMajor(_ sender: Any) {
        majorLabel.text=majorTextField.text
        majorTextField.isHidden=true
    }
    @IBAction func redoProfile(_ sender: Any) {
        nameTextField.text=nil
        majorTextField.text=nil
        yearTextField.text=nil
        nameTextField.isHidden=false
        yearTextField.isHidden=false
        majorTextField.isHidden=false
    }
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        let alert = UIAlertController(title: NSLocalizedString("Meliora", comment: ""), message: nil,  preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""),
                                         style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        self.present(alert, animated: true)
    }
    
}

   

