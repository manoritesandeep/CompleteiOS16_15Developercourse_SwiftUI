//
//  DetailsVC.swift
//  ArtBook
//
//  Created by Sandeep Solanki on 5/26/23.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artNameText: UITextField!
    @IBOutlet weak var artistNameText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingID : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if chosenPainting != "" {
            // Get data from core data
            
            //let stringUUID = chosenPaintingID!.uuidString
            // print(stringUUID)
            
            // Hiding and deactivating the save button when viewing paintings
            // saveButton.isEnabled = false
            saveButton.isHidden = true
            
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingID?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            artNameText.text = name
                        }

                            
                        if let artist = result.value(forKey: "artist") as? String {
                            artistNameText.text = artist
                        }
                                                  
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
            } catch {
                print("DetailView Fetch error")
                }
            
        }   else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            artNameText.text = ""
            artistNameText.text = ""
            yearText.text = ""
        }
        
        // Tap gesture recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self,
                                                       action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        // create gesture recognizer for selecting the image to save
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func selectImage() {
        // Library for user to access his photo/video library
        let picker = UIImagePickerController()
        picker.delegate = self
        // Note: .photoLibrary will be deprecated, use other alternatives
        picker.sourceType = .photoLibrary
        // allow editing for user
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    // what happens once the user chooses the image.. thats why we use navigation delegate, picker delegate etc....
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        // dismiss the image picker
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPaintings = NSEntityDescription.insertNewObject(forEntityName: "Paintings",
                                                               into: context)
        
        // Attributes
        
        newPaintings.setValue(artNameText.text, forKey: "name")
        newPaintings.setValue(artistNameText.text, forKey: "artist")
        
        // convert year string to integer
        if let year = Int(yearText.text!) {
            newPaintings.setValue(year, forKey: "year")
        }
        
        newPaintings.setValue(UUID(), forKey: "id")
        
        // convert image to BinaryData for saving
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        newPaintings.setValue(data, forKey: "image")
        
        do  {
            try context.save()
            print("Success")
        } catch {
            print("error")
        }
                
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"),
                                        object: nil)
        // once done saving, go back to the view controller
        self.navigationController?.popViewController(animated: true)
    }
}
