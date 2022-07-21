//
//  PhotoWallView.swift
//  WordsGoingApp
//
//  Created by Scholar on 7/21/22.
//

import UIKit

class PhotoWallView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var imagePicker = UIImagePickerController()
        
    //    keep track of the current image that we are changing, default: empty image view
        var currentImgView  = UIImageView()
        
    //    all the different image views on the screen ordered from left to right & row by row, so topmost left img is imgDisp1
        @IBOutlet weak var imgDisp1: UIImageView!
        @IBOutlet weak var imgDisp2: UIImageView!
        @IBOutlet weak var imgDisp3: UIImageView!
        @IBOutlet weak var imgDisp4: UIImageView!
        @IBOutlet weak var imgDisp5: UIImageView!
        @IBOutlet weak var imgDisp6: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            imagePicker.delegate = self
    //        send (delegate) info (photo taken/selected) collected back to this class (self)
        }
        
    //    when user clicks on the transparent button which covers the image view, show the alert that lets them choose the pic to display on the image view
        @IBAction func changeImg1(_ sender: Any) {
            showAlert(controller: self, imgDisp: imgDisp1)
        }
        
        @IBAction func changeImg2(_ sender: Any) {
            showAlert(controller: self, imgDisp: imgDisp2)
        }
        
        @IBAction func changeImg3(_ sender: Any) {
            showAlert(controller: self, imgDisp: imgDisp3)
        }
        
        @IBAction func changeImg4(_ sender: Any) {
            showAlert(controller: self, imgDisp: imgDisp4)
        }
    
        
    @IBAction func changeImg5(_ sender: Any) {
        print("called changeImg5")
        showAlert(controller: self, imgDisp: imgDisp5)
        
    }
    
    @IBAction func changeImg6(_ sender: Any) {
        showAlert(controller: self, imgDisp: imgDisp6)
    }
    
        //    show alert to choose between taking a pic or using saved pic from library
        func showAlert(controller: UIViewController, imgDisp: UIImageView) {
            let alert = UIAlertController(title: "Add a picture!", message: "Please Select an Option", preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "Take a picture", style: .default, handler: { (_) in
                        self.changePic(img: imgDisp, srcType: false)
                    }))

                    alert.addAction(UIAlertAction(title: "Use a picture from Library", style: .default, handler: { (_) in
                        print("called changePic")
                        self.changePic(img: imgDisp, srcType: true)
                    }))
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
                        print("User click Dismiss button")
                    }))
            
                    self.present(alert, animated: true, completion: {
                        print("completion block")
                    })
        }
        
    /*
     A function that displays the camera or library for the user to select a picture (and displays the image selected on the currentImgView).
     img intakes the current UIImageView on which to display the image the user selects.
     srcType value of true means the photo library is displayed, srcType value of false displays the camera.
     */
        func changePic(img : UIImageView, srcType :  Bool) {
            currentImgView = img
            if currentImgView == imgDisp5 {
                print("working")
            }else { print ("problem")}
            if (srcType) {
                imagePicker.sourceType = .photoLibrary
        //        tell app to go into the Photo Library
                present(imagePicker, animated: true, completion: nil)
        //        args: what you want me to show, animated: smooth animation? y/n?, after completion, what should i do? (nil means do nothing after)
        //        stop showing whatever you are showing, and present (show) the view where the user can see their photo library
            } else {
                imagePicker.sourceType = .camera
                present(imagePicker, animated: true, completion: nil)
            }
        }
        
    //    This func auto runs when the user selects a photo from cam / library
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // imagePickerController takes an argument, called info, which is a dictionary. That info dictionary holds the selected photo
           // below in the if let: we access the photo the user selected
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // update the pic with the selected pic
                currentImgView.image = selectedImage
    //            imageDisplay.image = selectedImage
            }
            // go back to our ViewController so the user can see the update
            imagePicker.dismiss(animated: true, completion: nil)
        }
        
        



}
