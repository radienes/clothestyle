//
//  ClothesViewController.swift
//  clothestyle
//
//  Created by Napatsorn Lam Sakulsuwan on 2/16/17.
//  Copyright © 2017 Napatsorn Lam Sakulsuwan. All rights reserved.
//

import UIKit

class ClothesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var clothesImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        clothesImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let clothes = Clothes(context: context)
        clothes.title = titleTextField.text
        clothes.image = UIImagePNGRepresentation(clothesImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}
