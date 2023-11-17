//
//  NewEntryViewController.swift
//  My-Watchbox
//
//  Created by Audrey Lam on 11/16/23.
//

import UIKit

class NewEntryViewController: UIViewController {
    
   
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    
    // When a new entry is created, this closure is called
    // pass in the task as an argument so it can be used by whoever presented the NewEntryViewController.
    var onComposeEntry: ((Entry) -> Void)? = nil
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        // Dismiss the NewEntryViewController.
        dismiss(animated: true)
    }
    

    @IBAction func didTapDoneButton(_ sender: Any) {
        // Make sure we have non-nil text and the text isn't empty
        guard let title = titleTextField.text,
              !title.isEmpty
        else {
            presentAlert(title: "Oops...", message: "Make sure to add a title!") // If it's nil or empty, present an alert prompting the user to enter a title
            return
        }
        
        guard let rating = ratingTextField.text,
              !rating.isEmpty
        else {
            presentAlert(title: "Oops...", message: "Make sure to add a rating!") // If it's nil or empty, present an alert prompting the user to enter a rating
            return
        }
        
        
        let note = noteTextView.text // can be empty

        let entry = Entry(title: title, rating: rating, note: note)
        
    
        onComposeEntry?(entry) // Call the "onComposeEntry" closure passing in the new entry
        dismiss(animated: true) // Dismiss the NewEntryViewController
    }
    
    
    private func presentAlert(title: String, message: String) {
        // Create an Alert Controller instance with, title, message and alert style
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) // Create an Alert Action (i.e. an alert button)
        // 3.
        alertController.addAction(okAction) // Add the action to the alert controller
        // 4.
        present(alertController, animated: true) // Present the alert
    }
    
}
